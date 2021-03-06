package kr.or.house.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.common.Photo;
import kr.or.common.Tour;
import kr.or.house.model.service.HouseService;
import kr.or.house.model.vo.FindMoveTour;
import kr.or.house.model.vo.House;
import kr.or.house.model.vo.HouseResult;
import kr.or.house.model.vo.houseAdjustPageData;
import kr.or.house.model.vo.housePageData;
import kr.or.main.model.service.MainService;
import kr.or.member.model.vo.Member;
import kr.or.room.model.vo.Room;

@Controller
@Component
public class HouseController {
	@Autowired
	private HouseService service;
	@Autowired
	private MainService mService;

	// 하우스 등록-jisung
	@RequestMapping(value = "/houseWriteFrm.do")
	public String houseWriteFrm() {
		return "house/houseWriteFrm";
	}

	// 메인에서 검색해서 하우스 리스트 출력- sowon
	@RequestMapping(value = "/houseList.do")
	public String houseList(String keyword, String houseGender, String houseForm, String roomPersonnel, Model model,String roomCharge1,String roomCharge2) {
		model.addAttribute("keyword", keyword);
		model.addAttribute("houseGender", houseGender);
		model.addAttribute("houseForm", houseForm);
		model.addAttribute("roomPersonnel", roomPersonnel);
		model.addAttribute("roomCharge1",roomCharge1);
		model.addAttribute("roomCharge2",roomCharge2);

		return "house/houseList";
	}
	
	// ajax 하우스 리스트 - sowon
	@ResponseBody
	@RequestMapping(value="/ajax_page.do", produces = "application/json;charset=utf-8")
	public String ajax_page(int pageNum, Model model, HttpSession session, String keyword, Room r, String roomCharge1,String roomCharge2, House h) {
		int memberNo = 0;
		if (session != null) {
			Member m = (Member) session.getAttribute("m");

			if (m != null) {
				memberNo = m.getMemberNo();
			}
		}
		HashMap<String, Object> data = service.selectAjaxHouse(pageNum, memberNo, keyword, r, roomCharge1, roomCharge2,h);
		/*
		 * model.addAttribute("list",data.get("list"));
		 */
		model.addAttribute("totalPageCount", data.get("totalPageCount"));
		model.addAttribute("startPageNum", data.get("startPageNum"));

		return new Gson().toJson(data);
	}

	// 하우스 등록-jisung
	@RequestMapping(value = "/houseWrite.do")
	public String houseWrite(House h, Address address, Income i, Model model, HttpSession session,
			MultipartFile[] photoPath, HttpServletRequest request) {
		/*
		 * 
		 * Member m = session.getattribute("m") m.memberNo
		 */

		HouseResult house = service.insertHouse(h, address, i); // 하우스 등록
		if (house.getResult() > 0) {
			ArrayList<Photo> list = new ArrayList<Photo>();
			int houseNo = house.getHouseNo();
			int houseRoom = h.getHouseRoom();
			if (photoPath[0].isEmpty()) {
				// 파일 없는경우
				return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
			} else {
				// 파일이 있는경우
				String photoPathfile = request.getSession().getServletContext().getRealPath("/resources/upload/house/");
				for (MultipartFile file : photoPath) {
					// 사용자가 올린 파일명
					String filename = file.getOriginalFilename();
					String onlyFilename = filename.substring(0, filename.indexOf(".")); // test
					String extention = filename.substring(filename.indexOf("."));// .txt
					String filepath = null;
					System.out.println("사진경로:" + filename);
					int count = 0;
					while (true) {
						if (count == 0) {
							filepath = onlyFilename + extention;// test.txt
						} else {
							filepath = onlyFilename + "_" + count + extention;// test_1.txt
						}
						File checkFile = new File(photoPathfile + filepath);// File>> java.io
						if (!checkFile.exists()) {// 똑같은 파일이 없을경우 중지
							break;
						}
						count++;
					}
					// 파일명 중복처리가 끝나면 파일업로드
					System.out.println("photoPathfile:" + photoPathfile);
					System.out.println("filepath" + filepath);
					try {
						// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
						FileOutputStream fos = new FileOutputStream(new File(photoPathfile + filepath));
						// 업로드 속도증가를 위한 보조스트림
						BufferedOutputStream bos = new BufferedOutputStream(fos);
						// 파일업로드
						byte[] bytes = file.getBytes();
						bos.write(bytes);
						bos.close();
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Photo p = new Photo();
					p.setPhotoPath(filepath);
					list.add(p);

				}

				int result = service.insertImgfiles(list, houseNo);
				if (result > 0) {

					return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;

				} else {
					return "house/houseWriteFrm";
				}
			}
			// return
			// "redirect:/roomList.do?houseNo="+house.getHouseNo()+"&memberNo="+h.getMemberNo();
		} else {
			return "house/houseWriteFrm";
		}
	}

	// 하우스 수정-jisung
	@RequestMapping(value = "/houseUpdate.do")
	public String houseUpdate(House h, Income i, String[] delPhotoPath, int[] delPhotoNo, MultipartFile[] photoPath,
			HttpServletRequest request, Model model) {
		// 삭제 이미지 삭제하기
		if (delPhotoNo != null) {
			int result = service.deletePhoto(delPhotoPath, delPhotoNo);
		}
		int house = service.updateHouse(h, i);
		int houseRoom = h.getHouseRoom();
		if (house > 0) {
			ArrayList<Photo> list = new ArrayList<Photo>();
			int houseNo = h.getHouseNo();
			if (photoPath[0].isEmpty()) {
				return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
			} else {
				String photoPathfile = request.getSession().getServletContext().getRealPath("/resources/upload/house/");
				for (MultipartFile file : photoPath) {
					// 사용자가 올린 파일명
					String filename = file.getOriginalFilename();
					String onlyFilename = filename.substring(0, filename.indexOf(".")); // test
					String extention = filename.substring(filename.indexOf("."));// .txt
					String filepath = null;
					System.out.println("사진경로:" + filename);
					int count = 0;
					while (true) {
						if (count == 0) {
							filepath = onlyFilename + extention;// test.txt
						} else {
							filepath = onlyFilename + "_" + count + extention;// test_1.txt
						}
						File checkFile = new File(photoPathfile + filepath);// File>> java.io
						if (!checkFile.exists()) {// 똑같은 파일이 없을경우 중지
							break;
						}
						count++;
					}
					// 파일명 중복처리가 끝나면 파일업로드
					System.out.println("photoPathfile:" + photoPathfile);
					System.out.println("filepath" + filepath);
					try {
						// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
						FileOutputStream fos = new FileOutputStream(new File(photoPathfile + filepath));
						// 업로드 속도증가를 위한 보조스트림
						BufferedOutputStream bos = new BufferedOutputStream(fos);
						// 파일업로드
						byte[] bytes = file.getBytes();
						bos.write(bytes);
						bos.close();
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Photo photo = new Photo();
					photo.setPhotoPath(filepath);
					list.add(photo);

				}

				int result3 = service.insertImgfiles(list, houseNo);
				if (result3 > 0) {

					return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;

				} else {
					return "house/houseWriteFrm";
				}
			}
		} else {
			model.addAttribute("msg", "하우스 수정실패");
			return "redirect:/houseOwnerList.do?memberNo=$" + h.getMemberNo() + "&reqPage=1";
		}
	}

	// 하우스 이미지 업로드-jisung
	@RequestMapping(value = "/houseUploadImage.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String houseUploadImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		// 내부경로저장
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/houseImg/");
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0, filename.indexOf("."));
		String extention = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while (true) {
			if (count == 0) {
				filepath = onlyFilename + extention;
			} else {
				filepath = onlyFilename + "_" + count + extention;
			}
			File checkFile = new File(savePath + filepath);
			if (!checkFile.exists()) {
				break;
			}
			count++;
		}

		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
			jsonObject.addProperty("url", "/resources/upload/houseImg/" + filepath);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonObject.toString();
	}

	// 하우스 리스트에서 좋아요 - sowon
	@ResponseBody
	@RequestMapping(value = "/houseListLike.do", method = {
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public String houseListLike(int memberNo, int houseNo) {
		int like_check = 0;
		like_check = mService.houseLike(memberNo, houseNo);
		int like_cnt = mService.houseLikeCount(houseNo);
		if (like_check == 0) {
			int like_up = mService.insertHouseLike(memberNo, houseNo);
			like_check++;
			like_cnt++;
		} else {
			int like_down = mService.deleteHouseLike(memberNo, houseNo);
			like_check--;
			like_cnt--;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("likeCheck", like_check);
		map.put("likeCnt", like_cnt);
		return new Gson().toJson(map);
	}

	// 하우스 상세보기 - sowon
	@RequestMapping(value = "/houseView.do")
	public String houseView(int houseNo, Model model, HttpSession session) {
		if (session != null) {
			Member m = (Member) session.getAttribute("m");
			int memberNo = 0;
			if (m != null) {
				memberNo = m.getMemberNo();
			}
			House h = service.selectHouseOneView(houseNo, memberNo);
			model.addAttribute("h", h);
			model.addAttribute("photo", h.getPhotoList());
			model.addAttribute("room", h.getHouseRoomView());
		}
		return "house/houseView";
	}

	// 내 하우스오너 리스트 보기-jisung
	@RequestMapping(value = "/houseOwnerList.do")
	public String houseOwnerList(int memberNo, int reqPage, Model model) {
		housePageData hpd = service.selectHouseOwnerList(memberNo, reqPage);
		model.addAttribute("list", hpd.getList());
		model.addAttribute("start", hpd.getStart());
		model.addAttribute("pageNavi", hpd.getPageNavi());
		model.addAttribute("totalCount", hpd.getTotalCount());
		model.addAttribute("moveTotalCount", hpd.getMoveTotalCount());
		model.addAttribute("tourTotalCount", hpd.getTourTotalCount());
		return "house/houseownerList";
	}

	// 하우스 업데이트 폼-jisung
	@RequestMapping(value = "/houseUpdateFrm.do")
	public String houseUpdateFrm(int houseNo, int memberNo, Model model) {
		House h = service.selectHouseUpdateOneView(houseNo, memberNo);
		if (h != null) {
			model.addAttribute("h", h);
			return "house/houseUpdateFrm";
		} else {
			model.addAttribute("msg", "입력하신 내용이 없습니다.");
			model.addAttribute("loc", "/houseOwnerList.do?memberNo="+memberNo+"&reqPage=1");
			return "common/msg";
		}
	}

	// 투어 신청 - sowon
	@RequestMapping(value = "/tourrequest.do")
	public String tourrequest(Tour t, Model model) {
		int result = service.insertTour(t);
		if (result > 0) {
			model.addAttribute("msg", "투어신청이 완료되었습니다.");
			model.addAttribute("loc", "/tourRequestList.do?reqPage=1");
		} else {
			model.addAttribute("msg", "투어신청이 실패되었습니다.");
			model.addAttribute("loc", "/");
		}
		return "common/msg";
	}

	// 입주신청페이지이동 - sowon
	@RequestMapping(value = "/roomMoveFrm.do")
	public String roomMoveFrm(int roomNo, int houseNo, Model model) {
		Room r = service.selectRoom(roomNo, houseNo);
		model.addAttribute("r", r);
		model.addAttribute("photo", r.getPhotoList());
		model.addAttribute("house", r.getHouse());
		return "house/roomMoveFrm";
	}

	// 하우스 삭제-jisung
	@RequestMapping(value = "/houseDelete.do")
	public String houseDelete(int memberNo, int houseNo, Model model) {
		FindMoveTour f= service.findMoveTour(houseNo);
		int reqPage = 1;
		if(f.getMoveList().isEmpty() && f.getTourList().isEmpty()) {
			int result = service.deleteHouse(memberNo, houseNo);
			if (result > 0) {
				model.addAttribute("msg", "하우스 삭제 성공");
				model.addAttribute("loc", "/houseOwnerList.do?memberNo="+memberNo+"&reqPage="+reqPage);
				return "common/msg";
			} else {
				model.addAttribute("msg", "하우스 삭제 성공");
				model.addAttribute("loc", "/houseOwnerList.do?memberNo="+memberNo+"&reqPage="+reqPage);
				return "common/msg";
			}			
		}else {
			model.addAttribute("msg", "이미 입주한 내역이 있거나 투어신청 내역이 있습니다.");
			model.addAttribute("loc", "/houseOwnerList.do?memberNo="+memberNo+"&reqPage="+reqPage);
			return "common/msg";
		}
	}

	// 하우스 오너 하우스 상세보기 - jisung
	@RequestMapping(value = "/houseOwnerRoom.do")
	public String houseOwnerRoom(int houseNo, int memberNo, Model model) {
		House h = service.selectHouseownerOneHouse(houseNo, memberNo);
		model.addAttribute("h", h);
		model.addAttribute("photo", h.getPhotoList());
		model.addAttribute("room", h.getHouseRoomView());
		return "house/houseownerView";
	}
	@RequestMapping(value = "/houseAdjustPayTS.do")
	public String houseAdjustPay(HttpSession session,Model model,int reqPage) {
		if(session != null) {
			Member m = (Member) session.getAttribute("m");
			if(m!=null) {
				int memberNo=m.getMemberNo();
				
				houseAdjustPageData hapd = service.selectHouseAllPayList(memberNo,reqPage);
				if(hapd!=null) {
					model.addAttribute("list", hapd.getList());
					model.addAttribute("start", hapd.getStart());
					model.addAttribute("pageNavi", hapd.getPageNavi());
					model.addAttribute("totalCount", hapd.getTotalCount());
					return "house/houseAdjustPayList";
				}else {
					model.addAttribute("msg", "정보가 없습니다.");
					model.addAttribute("loc","/main.do");
					return "common/msg";
				}
			}else {
			model.addAttribute("msg", "잘못된 정보입니다! 다시 로그인해주세요!");
			model.addAttribute("loc","/main.do");
			return "common/msg";
			}
		}else {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
	}
	//하우스 리스트 확인!!! 
	@Scheduled(cron = "0 01 00 * * ?"  ) //오전 12:01분확인
	public void checkHouseDeadLine() {
		System.out.println("하우스리스트 만료일 확인프로그램 실행!!");
		int result = service.updateChkDeadLine();
		System.out.println("룸 내용 실행");
		int result2 = service.updateChkRoomMoveEndDate();
	}
	
}

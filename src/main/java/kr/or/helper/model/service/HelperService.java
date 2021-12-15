package kr.or.helper.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Address;
import kr.or.helper.model.dao.HelperDao;
import kr.or.helper.model.vo.Helper;

@Service
public class HelperService {
	@Autowired
	private HelperDao dao;
	//사진없을때 
	public int helperRequestNoImg(Helper h, String[] addressCode, String[] addressName, String[] addressRoad,
			String[] addressLegal) {
			int result = dao.heplerRequestNoImg(h);
			if(result>0) {
				//배열인 주소 하나씩 꺼내기
				int helperNo= h.getHelperNo();
				for(int i=0; i<addressCode.length;i++) {
					Address addr = new Address();
					addr.setAddressCode(addressCode[i]);
					addr.setAddressName(addressName[i]);
					addr.setAddressLegal(addressLegal[i]);
					addr.setAddressRoad(addressRoad[i]);
					addr.setAddressNumber(helperNo);
					int result1 = dao.insertAddress(addr);
				}
				return result;
			}else {				
				return 0;
			}
	}
	//사진 있을때
	public int insertHouseAndImg(Helper h, String[] addressCode, String[] addressName, String[] addressRoad,
			String[] addressLegal) {
		int result  = dao.insertHouseAndImg(h);
		if(result>0) {
			int helperNo = h.getHelperNo();
			for(int i=0; i<addressCode.length;i++) {
				Address addr = new Address();
				addr.setAddressCode(addressCode[i]);
				addr.setAddressName(addressName[i]);
				addr.setAddressLegal(addressLegal[i]);
				addr.setAddressRoad(addressRoad[i]);
				addr.setAddressNumber(helperNo);
				int result1 = dao.insertAddress(addr);
			}
			return result;
		}
		return 0;
	}
	public Helper selectOneHelper(String helperName) {
		Helper h = dao.selectOneHelper(helperName);
		return h;
	}

}

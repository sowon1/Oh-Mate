package kr.or.house.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.house.model.dao.HouseDao;
import kr.or.house.model.vo.House;
import kr.or.house.model.vo.HouseResult;

@Service
public class HouseService {
	@Autowired
	private HouseDao dao;

	public HouseResult insertHouse(House h, Address address, Income i) {
		int result1 = dao.insertHouse(h); // 하우스등록 >> 등록 후 houseNo불러옴 >> address에 address_number에 대입
		if (result1 > 0) {
			System.out.println(h.getHouseNo());
			// 하우스 넘버를 넣어줌
			address.setAddressNumber(h.getHouseNo());
			int result2 = dao.insertAddress(address); // 주소등록(하우스주소)
			if (result2 > 0) {
				i.setIncomeNum(h.getHouseNo());
				int result3 = dao.insertIncome(i);// 계좌등록
				if (result3 > 0) {
					HouseResult hr = new HouseResult();
					hr.setHouseNo(h.getHouseNo());
					hr.setResult(result3);
					return hr;
				} else {
					return null;
				}
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

}

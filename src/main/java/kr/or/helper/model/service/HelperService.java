package kr.or.helper.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.helper.model.dao.HelperDao;
import kr.or.helper.model.vo.Helper;

@Service
public class HelperService {
	@Autowired
	private HelperDao dao;

	public int helperRequestNoImg(Helper h, String[] addressCode, String[] addressName, String[] addressRoad,
			String addressLegal) {
			
			
		return 0;
	}
	
	}


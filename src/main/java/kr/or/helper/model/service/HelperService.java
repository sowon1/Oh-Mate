package kr.or.helper.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.helper.model.dao.HelperDao;

@Service
public class HelperService {
	@Autowired
	private HelperDao dao;
}

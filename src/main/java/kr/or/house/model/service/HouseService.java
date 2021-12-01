package kr.or.house.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.house.model.dao.HouseDao;

@Service
public class HouseService {
	@Autowired
	private HouseDao dao;
}

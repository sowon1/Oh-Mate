package kr.or.room.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.room.model.service.RoomDao;

@Service
public class RoomService {
	@Autowired
	private RoomDao dao;
}

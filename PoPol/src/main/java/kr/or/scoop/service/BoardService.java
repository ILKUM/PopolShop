package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dto.Notice;

@Service
public class BoardService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int insertNotice(Notice notice) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.insertNotice(notice);
		
		return result;
		
		
	}
}

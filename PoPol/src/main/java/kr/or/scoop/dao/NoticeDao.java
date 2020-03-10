package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Notice;

public interface NoticeDao {
	
	public List<Notice> getNotice(); // 공지사항 리스트 
	
	public int insertNotice(Notice notice); //공지사항 작성 
}

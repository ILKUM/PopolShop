package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Notice;

public interface NoticeDao {
	
	//공지사항 리스트 
	public List<Notice> getNotice(); 
	
	//공지사항 작성 
	public int insertNotice(Notice notice); 
	
	//공지사항 디테일 
	public Notice detailNotice(int noseq); 
	
	//공지사항 삭제
	public int deleteNotice(int noseq); 
	
	//공지사항 조회수 증가
	public int nrnumCount(int noseq); 
	
	//공지사항 수정
	public int updateNotice(Notice notice);
	
}

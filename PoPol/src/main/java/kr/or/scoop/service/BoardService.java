package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.BoardDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.Recommend;
import kr.or.scoop.dto.Review;

@Service
public class BoardService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//공지사항 작성
	public int insertNotice(Notice notice) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.insertNotice(notice);
		
		return result;
		
	}
	
	//리뷰작성 
	public int insertReview(Review review) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.insertReview(review);
		
		return result;
	}
	
	//추천작성 
		public int insertRecomm(Recommend recom) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.insertRecomm(recom);
			
			return result;
		}
		
		public int rernumUp(int reseq) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.rernumCount(reseq);
			return result;
			
		}
		
		public int relikeUp(int reseq) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.relikeCount(reseq);
			return result;
		}
		
		public int insertRelike(int reseq, String email) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.insertRelike(reseq, email);
			return result;
		}
}

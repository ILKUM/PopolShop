package kr.or.scoop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.BoardDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.Recommend;
import kr.or.scoop.dto.Review;
import kr.or.scoop.dto.RvReply;

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
		
		//리뷰글 조회수 증가
		public int rernumUp(int reseq) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.rernumCount(reseq);
			return result;
			
		}
		
		//추천 수 증가 
		public int relikeUp(int reseq) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.relikeCount(reseq);
			return result;
		}

		//공지사항 조회수 증가
		public int nrnumUp(int noseq) {
			int result = 0;
			NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
			result = dao.nrnumCount(noseq);
			return result;
			
		}
		
		//댓글 처리
		public int reviewComment(int reseq,String rvrcontent,String email) {
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			int result = dao.reviewComment(reseq,rvrcontent,email);
			return result;
		}
		
		//댓글 리스트 
		public List<RvReply> reviewCommentOk(int reseq){
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			List<RvReply> result = dao.reviewCommentOk(reseq);
			return result;
		}
		
		//추천글 조회수 증가
		public int rcrnumUp(int rcseq) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.rcrnumCount(rcseq);
			return result;
					
		}
		//공지사항 수정 체크
		public int updateNotice(Notice notice) {
			int result = 0;
			NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
			result = dao.updateNotice(notice);
			
			return result;
		}
		
		//리뷰글 수정 체크
		public int updateReview(Review review) {
			int result = 0;
			BoardDao dao = sqlsession.getMapper(BoardDao.class);
			result = dao.updateReview(review);
			return result;
		}
}

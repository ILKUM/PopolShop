package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.BoardDao;
import kr.or.scoop.dao.MovieDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dto.File;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.Recommend;
import kr.or.scoop.dto.Review;

@Service
public class BoardService {

	@Autowired
	private SqlSession sqlsession;

	// 공지사항 작성
	public int insertNotice(Notice notice) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.insertNotice(notice);

		return result;

	}

	// 리뷰작성
	public int insertReview(Review review) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.insertReview(review);

		return result;
	}

	// 추천작성
	public int insertRecomm(Recommend recom) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.insertRecomm(recom);

		return result;
	}

	// 리뷰글 조회수 증가
	public int rernumUp(int reseq) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.rernumCount(reseq);
		return result;

	}

	// 추천 수 증가
	public int relikeUp(int reseq) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.relikeCount(reseq);
		return result;
	}

	// 공지사항 조회수 증가
	public int nrnumUp(int noseq) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.nrnumCount(noseq);
		return result;

	}

	// 댓글 처리
	public int reviewComment(int reseq, String rvrcontent, String email) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result = dao.reviewComment(reseq, email, rvrcontent);
		return result;
	}

	// 추천글 조회수 증가
	public int rcrnumUp(int rcseq) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.rcrnumCount(rcseq);
		return result;

	}

	// 공지사항 수정 체크
	public int updateNotice(Notice notice) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.updateNotice(notice);

		return result;
	}

	// 리뷰글 수정 체크
	public int updateReview(Review review) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.updateReview(review);
		return result;
	}

	// 추천글 수정 체크
	public int updateRecom(Recommend recom) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.updateRecom(recom);
		return result;
	}

	// 리뷰 글 삭제
	public int deleteReview(int reseq) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.deleteReview(reseq);
		return result;

	}

	// 공지사항 삭제
	public int deleteNotice(int noseq) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.deleteNotice(noseq);
		return result;

	}

	// 추천글 삭제
	public int deleteRecom(int rcseq) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.deleteRecom(rcseq);
		return result;

	}

	// 파일 글 작성
	public int insertFile(File file) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.insertFile(file);
		return result;
	}

	// 파일 글 작성시 포인트 차감
	public int minusPoint(String email) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.minusPoint(email);
		return result;
	}

	// 파일 글 삭제
	public int deleteFile(int fseq) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.deleteFile(fseq);
		return result;
	}

	// 파일글 조회수 업
	public int readFile(int fseq) {
		int result = 0;
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		result = dao.readFile(fseq);
		return result;
	}

	// 리뷰 댓글 삭제
	public int delReviewComment(int rvrseq) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result = dao.delReviewComment(rvrseq);
		return result;
	}

	// 영화 댓글 처리
	public int movieComment(int moseq, String morcontent, String email) {
		MovieDao dao = sqlsession.getMapper(MovieDao.class);
		int result = dao.movieComment(moseq, email, morcontent);
		return result;
	}

	// 영화 댓글 삭제
	public int delMovieComment(int morseq) {
		MovieDao dao = sqlsession.getMapper(MovieDao.class);
		int result = dao.delMovieComment(morseq);
		return result;
	}

	// 추천 댓글 처리
	public int recomComment(int rcseq, String rcrcontent, String email) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result = dao.recomComment(rcseq, email, rcrcontent);
		return result;
	}

	// 추천 댓글 삭제
	public int delRecomComment(int rcrseq) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result = dao.delReviewComment(rcrseq);
		return result;
	}

	// 파일 댓글 처리
	public int fileComment(int fseq, String frcontent, String email) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		int result = dao.fileComment(fseq, email, frcontent);
		return result;
	}
	

}

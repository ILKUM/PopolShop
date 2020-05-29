package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Recommend;
import kr.or.scoop.dto.Review;
import kr.or.scoop.dto.RvReply;

public interface BoardDao {
	
	//리뷰 작성
	public int insertReview(Review review);
	
	//리뷰 리스트
	public List<Review> getReview();
	
	//리뷰 글 디테일
	public Review selectReview(int reseq);
	
	//리뷰 글 조회수 증가
	public int rernumCount(int reseq);
	
	//리뷰 글 추천 증가
	public int relikeCount(int reseq);
	
	//리뷰글 추천 중복방지
	public int insertRelike(int reseq,String email);
	
	//리뷰글 추천 중복방지
	public int getrelike(String email, int reseq);
	
	//리뷰글 추천 삭제
	public int deleteRelike(int reseq,String email);
	
	//추천 작성
	public int insertRecomm(Recommend recom);
	
	//추천 리스트
	public List<Recommend> getRecomm();

	//댓글 등록
	public int reviewComment(int reseq,String rvrcontent,String email);
	
	//댓글 처리
	public List<RvReply> reviewCommentOk(int reseq);
	
}

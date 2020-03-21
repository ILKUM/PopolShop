package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Recommend;
import kr.or.scoop.dto.Review;

public interface BoardDao {
	
	//리뷰 작성
	public int insertReview(Review review);
	
	//리뷰 리스트
	public List<Review> getReview();
	
	//리뷰 글 디테일
	public Review selectReview(int reseq);
	
	//추천 작성
	public int insertRecomm(Recommend recom);
	
	//추천 리스트
	public List<Recommend> getRecomm();
	
}

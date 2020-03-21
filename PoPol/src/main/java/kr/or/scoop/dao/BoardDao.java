package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Review;

public interface BoardDao {
	
	//리뷰 작성
	public int insertReview(Review review);
	
	//리뷰 리스트
	public List<Review> getReview();
	
}

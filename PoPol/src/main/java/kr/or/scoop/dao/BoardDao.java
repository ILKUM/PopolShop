package kr.or.scoop.dao;

import kr.or.scoop.dto.Review;

public interface BoardDao {
	
	//리뷰 작성
	public int insertReview(Review review);
	
	
}

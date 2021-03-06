package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.File;
import kr.or.scoop.dto.FileReply;
import kr.or.scoop.dto.RcReply;
import kr.or.scoop.dto.Recommend;
import kr.or.scoop.dto.Redown;
import kr.or.scoop.dto.Review;
import kr.or.scoop.dto.RvReply;

public interface BoardDao {

	///////////////// 리뷰 /////////////////////////
	
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
	
	//댓글 등록
	public int reviewComment(int reseq,String email,String rvrcontent);
	
	//댓글 리스트
	public List<RvReply> reviewCommentOk(int reseq);		
	
	//리뷰 글 수정
	public int updateReview(Review review);
	
	//리뷰 글 사진
	public String getReviewImg(int reseq);
	
	//리뷰 글 삭제
	public int deleteReview(int reseq);
	
	//내가 작성한 리뷰글
	public List<Review> getWriteReview(String email);
	
	//리뷰 댓글 삭제
	public int delReviewComment(int rvrseq);
	
	/////////////// 	추천          	//////////////////
	
	//추천글작성
	public int insertRecomm(Recommend recom);
	
	//추천 리스트
	public List<Recommend> getRecomm();
	
	//추천 게시판 디테일
	public Recommend detailRecomm(int rcseq);
	
	//추천글 추천 중복방지
	public int getrclike(String email, int rcseq);
	
	//추천글 추천 중복방지
	public int insertRclike(int rcseq,String email);
	
	//추천 글 추천 증가
	public int rclikeCount(int rcseq);
	
	//추천 글 조회수 증가
	public int rcrnumCount(int rcseq);
	
	//추천 글 삭제
	public int deleteRecom(int rcseq);
	
	//추천글 수정
	public int updateRecom(Recommend recom);
	
	//추천 글 사진
	public String getRecomImg(int rcseq);
	
	//내가 작성한 추천글
	public List<Recommend> getWriteRecom(String email);
	
	//추천 댓글 등록
	public int recomComment(int rcseq,String email,String rcrcontent);
		
	//추천 댓글 리스트
	public List<RcReply> recomCommentOk(int rcseq);
	
	//리뷰 댓글 삭제
	public int delRecomComment(int rcrseq);
		
	
	//////////////// 파일 //////////////////////
	
	//파일 게시판 리스트
	public List<File> getFileBoard();
	
	//파일 글 작성
	public int insertFile(File file);
	
	//파일 글 작성시 포인트 차감
	public int minusPoint(String email);
	
	//파일 글 삭제
	public int deleteFile(int fseq);
	
	//파일 글 디테일 
	public File detailFile(int fseq);
	
	//파일 글 추천 확인
	public int checkFile(int fseq,String email);
	
	//파일글 추천 중복방지
	public int insertFlike(int fseq,String email);
	
	//파일글 추천수 증가
	public int flikeUp(int fseq);
	
	//파일글 조회수 증가
	public int readFile(int fseq);
	
	//내가 작성한 파일글
	public List<File> getWriteFile(String email);
	
	//파일 댓글 등록
	public int fileComment(int fseq,String email,String frcontent);
	
	//파일 댓글 리스트
	public List<FileReply> fileCommentOk(int fseq);
	
	//파일 댓글 삭제
	public int delFileComment(int frseq);
	
	//파일 가져오기
	public String getFilename(int fseq);
	
	//파일 글 수정 체크
	public int updateFile(File file);
	
	//파일 다운횟수 증가
	public int downFile(int fseq);
	
	//////////////// 다운로드 한 파일 /////////////
	
	public List<Redown> redownBoardGet(String email);
	
	public int redownInsert(int moseq , String email);
	
}

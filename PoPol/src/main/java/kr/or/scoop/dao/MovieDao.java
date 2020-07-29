package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.JJim;
import kr.or.scoop.dto.MoReply;
import kr.or.scoop.dto.Movie;

public interface MovieDao {	
	
	//영화 추가 
	public int insertMovie(Movie movie); 
	
	//모든 영화 리스트
	public List<Movie> getMovieList(); 
	
	//한국영화 리스트
	public List<Movie> getKorea(); 
	
	//미국영화 리스트
	public List<Movie> getAmerican();
	
	//중국영화 리스트
	public List<Movie> getChina();
	
	//유럽영화 리스트
	public List<Movie> getEurope();
	
	//일본영화 리스트
	public List<Movie> getJapan();
	
	//영화 검색
	public List<Movie> searchMovie(String word);
	
	//영화 디테일
	public Movie selectMovie(int moseq);
	
	//영화 찜 추가
	public int addMovieJJim(int moseq,String email); 
	
	//영화 찜 삭제
	public int delMovieJJim(int moseq,String email); 
	
	//찜 리스트
	public List<JJim> getMovieJJim(String email); 
	
	//지난 영화리스트 
	public List<Movie> getHistory(String email); 
	
	//영화글 추천 중복방지
	public int getmolike(String email, int moseq);
		
	//영화글 추천 중복방지
	public int insertMolike(int moseq,String email);
		
	//영화글 추천 증가
	public int molikeCount(int moseq);
	
	//영화 댓글
	public int movieComment(int moseq,String email,String morcontent);
	
	//댓글 리스트
	public List<MoReply> movieCommentOk(int moseq);
	
	//영화 댓글 삭제
	public int delMovieComment(int morseq);
	
	//영화 이미지
	public String getMovieImg(int moseq);
	
	//영화 수정 체크
	public int updateMovie(Movie movie);
	
	//영화 가격 가져오기
	public int getMpoint(int moseq);
	
	//영화 다운로드 기록
	public int getDownCount(int moseq,String email);
	
}

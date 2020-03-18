package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Movie;

public interface MovieDao {	
	public int insertMovie(Movie movie); //영화 추가 
	
	public List<Movie> getKorea(); //한국영화 리스트
	
	public List<Movie> getAmerican();//미국영화 리스트
	
	public List<Movie> getChina();//중국영화 리스트
	
	public List<Movie> getEurope();//유럽영화 리스트
	
	public List<Movie> getJapan();//일본영화 리스트
	
	public List<Movie> searchMovie(String word); //영화 검색
	
}

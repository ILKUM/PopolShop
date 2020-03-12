package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Movie;

public interface MovieDao {
	
	public List<Movie> getMovie(int monum); //영화 리스트 출력
	
	public int insertMovie(Movie movie); //영화 추가 
	
}

package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Movie;

public interface MovieDao {	
	public int insertMovie(Movie movie); //영화 추가 
	
	public List<Movie> getKorea();
	
	public List<Movie> getAmerican();
	
	public List<Movie> getChina();
	
	public List<Movie> getEurope();
	
	public List<Movie> getJapan();
	
}

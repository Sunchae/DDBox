package kr.spring.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieFavVO;
import kr.spring.movie.vo.MovieVO;

@Mapper
public interface MovieMapper {
	//영화 데이터 삽입
	public void insertMovieData(MovieVO movie);
	//영화 데이터 2차 삽입(정보 업데이트)
	public void updateMovieData(MovieVO movie);
	
	
	//movie pk 겹치는지 확인
	@Select("SELECT * FROM movie WHERE movie_num = #{movie_num}")
	public MovieVO selectByMovieNum(int movie_num);
	
	//영화 리스트 뽑기
	@Select("SELECT * FROM (SELECT * FROM movie ORDER BY movie_popularity DESC) WHERE ROWNUM <= 10")
	public List<MovieVO> selectList(Map<String, Object> map);
	//예매페이지 날짜 선택 후 영화 리스트 뽑기 
	public List<MovieVO> selectMoviesByDate(String date);
	
	
	

	@Select("SELECT * FROM (SELECT * FROM movie ORDER BY movie_popularity DESC) WHERE ROWNUM <= 10")
	public List<MovieVO> selectMovieList();
	@Select("SELECT * FROM movie WHERE movie_num=#{movie_num}")
	public MovieVO selectMovie(int movie_num);
	
	
	
	
	
	
	
	//영화 좋아요 삽입 
	public MovieFavVO selectFav(MovieFavVO fav);
	//영화 좋아요 삭제
	//영화 좋아요 개수
	public int selectFavCount(int movie_num);
	public void insertFav(MovieFavVO fav);
	public void deleteFav(MovieFavVO fav);
	public void deleteFavByMovieNum(int Movie_num);
	//====영화 상세정보====
	//영화 상세 정보들 호출
		
	
	
}





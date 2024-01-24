package kr.spring.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieFavVO;
import kr.spring.movie.vo.MovieVO;

@Mapper
public interface MovieMapper {
	//영화 리스트 뽑기
	@Select("SELECT movie_title,movie_gradeNm,movie_poster FROM movie ORDER BY movie_title ASC")
	public List<MovieVO> selectList(Map<String, Object> map);
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

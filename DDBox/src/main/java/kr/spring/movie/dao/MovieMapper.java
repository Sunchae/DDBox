package kr.spring.movie.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.movie.vo.MovieFavVO;

@Mapper
public interface MovieMapper {
	//영화 박스오피스 리스트 뽑기
	
	
	//영화 좋아요 삽입 
	public MovieFavVO selectFav(MovieFavVO fav);
	//영화 좋아요 삭제
	//영화 좋아요 개수
	public int selectFavCount(int movie_num);
	
	
	//====영화 상세정보====
	//영화 상세 정보들 호출
	
	
	
	
}

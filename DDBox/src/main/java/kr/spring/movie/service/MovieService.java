package kr.spring.movie.service;

import java.util.List;
import java.util.Map;

import kr.spring.movie.vo.MovieFavVO;
import kr.spring.movie.vo.MovieVO;

public interface MovieService {
	//영화 리스트 뽑기
		public List<MovieVO> selectList(Map<String, Object> map);
		
		public MovieVO selectMovie(int movie_num);
		//영화 좋아요 삽입 
		public MovieFavVO selectFav(MovieFavVO fav);
		//영화 좋아요 삭제
		//영화 좋아요 개수
		public int selectFavCount(int movie_num);
		public void insertFav(MovieFavVO fav);
		public void deleteFav(MovieFavVO fav);
		public void deleteFavByMovieNum(int Movie_num);
}

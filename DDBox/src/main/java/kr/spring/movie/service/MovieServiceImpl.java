package kr.spring.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.movie.dao.MovieMapper;
import kr.spring.movie.vo.MovieFavVO;
import kr.spring.movie.vo.MovieVO;

@Service
@Transactional
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieMapper movieMapper;
	
	@Override
	public List<MovieVO> selectList(Map<String, Object> map) {
		return movieMapper.selectList(map);
	}

	@Override
	public MovieFavVO selectFav(MovieFavVO fav) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectFavCount(int movie_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertFav(MovieFavVO fav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFav(MovieFavVO fav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFavByMovieNum(int Movie_num) {
		// TODO Auto-generated method stub
		
	}

}

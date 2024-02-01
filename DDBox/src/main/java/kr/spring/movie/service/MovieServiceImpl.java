package kr.spring.movie.service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.movie.dao.MovieMapper;
import kr.spring.movie.vo.MovieFavVO;
import kr.spring.movie.vo.MovieVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public MovieVO selectMovie(int movie_num) {
		return movieMapper.selectMovie(movie_num);
	}
	
	@Override
	public List<MovieVO> selectMovieList() {
		return movieMapper.selectMovieList();
	}
	
	@Override
	public void saveMovieDataFromList(List<MovieVO> movieList) {
		log.debug("==============영화 저장 서비스 진입================");
		for (MovieVO movie : movieList) {
			MovieVO vo = movieMapper.selectByMovieNum(movie.getMovie_num());
			if(vo==null) {
				movieMapper.insertMovieData(movie);
			}else {
				log.debug("중복된 데이터 : " + movie.getMovie_num());
			}
			
		}
		
	}

	
	/*==================================
	 * 영화 좋아요 PART
	 ===================================*/
	@Override
	public MovieFavVO selectFav(MovieFavVO fav) {
		return null;
	}

	@Override
	public int selectFavCount(int movie_num) {
		return 0;
	}

	@Override
	public void insertFav(MovieFavVO fav) {
		
	}

	@Override
	public void deleteFav(MovieFavVO fav) {
		
	}

	@Override
	public void deleteFavByMovieNum(int Movie_num) {
		
	}
	

	
}	
	
	 



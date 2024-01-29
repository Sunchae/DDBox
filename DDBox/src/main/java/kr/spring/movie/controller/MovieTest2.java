package kr.spring.movie.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MovieTest2 {
	
	
	public String getMovieDetail(String[] args) throws IOException, InterruptedException, ParseException {
		MovieVO movieVO = new MovieVO();
		int movie_num = movieVO.getMovie_num();
		
		//영화 id 입력해서 영화 상세정보 호출 api
		HttpRequest request = HttpRequest.newBuilder()				//영화 id
			    .uri(URI.create("https://api.themoviedb.org/3/movie/" + movie_num + "?language=ko-KR"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYTQ0ZjdiYTIyZTdiN2E1YTdkNDFkNmZlYWYzOWNlYSIsInN1YiI6IjY1YWVhODc1YWFkOWMyMDBjYTVhMGY5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QSYL0JwzjYqHZIIl_kZIu9S6ZTo5EAJUyc2FrTSsNMk")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		//System.out.println(response.body());
		
		 // json형태의 string일 경우
        String jsonData = response.body();
        // reader를 Object로 parse
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(jsonData); 
        

        JSONObject jsonObj = (JSONObject)obj;
        
        movieVO.setMovie_num(Math.toIntExact((Long) jsonObj.get("id")));
        movieVO.setMovie_runtime(Math.toIntExact((Long)jsonObj.get("runtime")));
        movieVO.setMovie_status((String)jsonObj.get("status"));
        movieVO.setMovie_tagline((String)jsonObj.get("tagline"));
        movieVO.setMovie_director((String)jsonObj.get("director"));
        
        
        //System.out.println((Long)jsonObj.get("id"));
        //System.out.println((String)jsonObj.get("overview"));
        //System.out.println((Long)jsonObj.get("runtime"));
		
        return "";
        
	}
}
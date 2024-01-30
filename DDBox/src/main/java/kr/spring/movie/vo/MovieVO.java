package kr.spring.movie.vo;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Entity
@Table(name = "movie")
public class MovieVO {
	@Id
	private int movie_num;
	
	private String movie_title;
	private String movie_original_title;
	private String movie_tagline;
	private String movie_overview;
	private String movie_director;
	private Date movie_opendate;
	private int movie_gradeNm;
	private double movie_popularity;
	private String movie_poster;
	private String movie_img1;
	private String movie_img2;
	private String movie_img3;
	
	private int movie_runtime;
	private String movie_status;
	
}

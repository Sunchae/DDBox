<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- 내용 시작 -->
<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>


	<h1>영화 메인 페이지</h1>

	<c:forEach var="movie" items="${list}">
	<div class="movie-lists">
		<a href="/movie/movieDetail?movie_num=${movie.movie_num}"><img src="https://image.tmdb.org/t/p/w500/${movie.movie_poster}"></a>
		<span>${movie.movie_title}</span>
	</div>
	</c:forEach>
<!-- <script type="text/javascript">
let imageUrl = "https://image.tmdb.org/t/p/w500/";
let $div = $("#movie-lists");


    // 영화 목록을 가져와서 화면에 표시
	function getMovieList(){    
		$.ajax({					
			type: 'get',
			url: '/movie/list',
			
			dataType: 'json',
			success: function(response) {
				
				showLists(response);
			},
			error: function() {
		         console.error('영화 목록을 가져오는 데 실패했습니다.');
		     }
		});	
    }
    
    getMovieList();
	
    function showLists(response) {
		let movieList = response.results;
		
		
		$.each(movieList, function(index, movie) {
			
			let poster = imageUrl + movie.movie_poster; 						
			let output = "";
			
			output += "<div>";
			output += "<a href='/movie/detail?no="+movie.movie_num+"'>";
			if (movie.movie_poster) {
				output += "<img src = '" +movie.movie_poster+ "'class='rounded card-img-top' style='width: 17rem; height:440px;'/>";
			} else {
				output += "<img src ='/images/ddbox gray.png' class='rounded card-img-top' style='width: 17rem; height:440px;'/>";
			}
			output += "</a>";
			if (movie.movie_title) {
				output += "<p class='mt-2 title-txt'>" + movie.movie_title + "</p>";
			} else {
				output += "<p class='mt-2 title-txt'>"+ movie.movie_original_title +"</p>";
			}
			if (movie.movie_opendate) {
				output += "<span class='openDt-txt'> 개봉일 | "+ movie.movie_opendate +"</span>";
			} else {
				output += "<span class='openDt-txt'> 개봉일 |  미정</span>";
			}
			output += "<div class='d-flex'>";
			output += "<button id='btn-"+ movie.movie_num +"' class='btn btn-light btn-like col-5 mt-1 float-end' data-no='"+ movie.movie_num +"' type='button' style='margin-right: 15px;'><img class='me-3' src='#'></button>";
			output += "<button type='button' class='btn btn-primary ticket col-5 mt-1 float-end'><a href='#"+movie.movie_num+"'>예매</a></button>";
			output += "</div>";
			output += "</div>";
			
			
			
			 $div.append(output);
		});
	}

</script>
 -->
<!-- 내용 끝 -->

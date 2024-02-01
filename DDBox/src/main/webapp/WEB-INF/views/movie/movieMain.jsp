<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 시작 -->
<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>


	<h1>영화 메인 페이지</h1>
	<input type="button" value="영화 상세페이지" onclick="location.href='${pageContext.request.contextPath}/movie/movieDetail'">

<div id="movie-lists" class="tab-content" id="nav-tabContent">
	<div class="ms-4 tab-pane fade show active" id="nav-boxoffice"
		role="tabpanel" aria-labelledby="nav-boxoffice-tab">
		<div class="row mt-3 poster"></div>
	</div>
	<div class="ms-4 tab-pane fade" id="nav-upcoming" role="tabpanel"
		aria-labelledby="nav-upcoming-tab">
		<div class="row mt-3 poster"></div>
	</div>
	<div class="ms-4 tab-pane fade" id="nav-trending" role="tabpanel"
		aria-labelledby="nav-trending-tab">
		<div class="row mt-3 poster"></div>
	</div>
</div>
<div class="mt-1 mb-3">
	<div class="container">
		<button id="searchMore" class="btn btn-light col-sm-12">
			더보기 <img alt="" src="#">
		</button>
	</div>
	<%--<a href="해당 영화 디테일 페이지 링크">
        <img src="포스터 이미지 경로" alt="포스터">
    </a>
    <p class="movie-title">
        영화 제목
    </p>
    <span class="release-date">
        영화 출시일
    </span>

    <div class="d-flex">
        <button class="like-button">
            좋아요 <span class="like-count">0</span>
        </button>
        <button class="reserve-button">
            영화 예매
        </button>
    </div>    --%>
</div>
<script type="text/javascript">
$(document).ready(function () {
	let imageUrl = "https://image.tmdb.org/t/p/w500/";
	getMovieList();
    // 영화 목록을 가져와서 화면에 표시
function getMovieList(){}    
	$.ajax({					
		type: 'get',
		url: '/movie/list',
		
		dataType: 'json',
		success: function(response) {
			console.log(response);
			let resultCount = response.total_results;
			
			if (resultCount > 100) {
				resultCount = 100;
				
				totalPage = Math.ceil(resultCount/20);
				$("#count").text(100);
				
			} else {
				console.log(response);
				totalPage = Math.ceil(resultCount/20);
				$("#count").text(resultCount);
			}
			showLists(response);
		},
		error: function() {
	         console.error('영화 목록을 가져오는 데 실패했습니다.');
	     }
});	


function showLists(response) {
	let movieList = response.results;
	
	
	$.each(movieList, function(index, movie) {
		
		let poster = imageUrl+movie.movie_poster; 						
		let output = "";
		
		output += "<div class='col-3 mb-5' style='padding-left: 0px;'>";
		output += "<a href='/movie/detail?no="+movie.movie_num+"'>";
		if (movie.movie_poster) {
			output += "<img src = '" +poster+ "'class='rounded card-img-top' style='width: 17rem; height:440px;'/>";
		} else {
			output += "<img src ='/resources/images/ddbox gray.png' class='rounded card-img-top' style='width: 17rem; height:440px;'/>";
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
		output += "<button id='btn-"+ movie.movie_num +"' class='btn btn-light btn-like col-5 mt-1 float-end' data-no='"+ movie.movie_num +"' type='button' style='margin-right: 15px;'><img class='me-3' src='/resources/images/noimage.png'></button>";
		output += "<button type='button' class='btn btn-primary ticket col-5 mt-1 float-end'><a href='/ticketing/screenList?no="+movie.movie_num+"'>예매</a></button>";
		output += "</div>";
		output += "</div>";
		
		
		
		 $("#movie-lists").append(output);
		 
		
	});
}
});
</script>

<!-- 내용 끝 -->

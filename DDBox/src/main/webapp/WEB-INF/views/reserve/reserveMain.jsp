<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매</title>
</head>
<body>
	<h3>빠른 예매</h3>
	<div class="container" style="display:flex; font-size:15pt;">
		<!------------------------------ 양화 ------------------------------>
		<div style="width:33%; height:700px;">
		<div class="v-line" style="border-right: 3px solid #ccc; height:100%; left: 50%;">
			<div class="left-one">
				<h3 class="align-center" style="width:100%; height:40px; background-color:black; color:white;">영화</h3>
				<div class="col-head align-center" >
					<a href="#" onclick="sortMovieByRank();return false;" id="movieSortRank-btn" class="button btn-rank selected">예매율순</a> 
					<a href="#" onclick="sortMovieByName();return false;" id="movieSortName-btn" class="button btn-abc">가나다순</a>
				</div>
				<div class="col-body">
					<c:forEach var="reserve" items="${list}">
						<ul>
							<li class="align-center">${reserve.movie_title}</li>
						</ul>
					</c:forEach>
					
				</div>
				<div class="movie-img">
					<div class="choice-list" id="choiceMovieList-0">
						<img id="picture" src="${movie.movie_poster}">
						<p id="picture-name" style="border-style:dotted">영화를 클릭하세요</p>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!-- <script type="text/javascript">
			$(document).on('click','.movie_title_list', function(){
				let movie_title = $(this).attr('movie_title');
				let movie_poster = $(this).parent().find('img');
				
				let inputUI = '<p id="select_movie">';
					inputUI += '<img src="${movie.movie_poster}">';
					inputUI += ${movie.movie_title};
					inputUI += '</p>';
			});
		</script> -->
		<!-- li 클릭시 영화 제목+포스터 출력& 해당 영화가 상영되고 있는 극장 -->
		
		<!------------------------------ 극장 ------------------------------>
		<div style="width:33%; height:700px;">
			<div class="v-line" style="border-right: 3px solid #ccc; height:100%; left: 50%;">
			<div class="center-one">
				<h3 class="align-center" style="width:100%; height:40px; background-color:black; color:white;">극장</h3>
				<div class="list-theater-detail">
					<div class="all-theater-list">
						<div class="explain-button">
							<c:forEach var="region" items="${regions }">
								<button class='list-theater-button' data-region='${region.no }'
									style="display: none">${region.name }</button>
							</c:forEach>
						</div>
					</div>
					<div class="theater-choies"></div>
				</div>
				
				<div class="theater-choies-check">
					<p class="check-content"  style="border-style:dotted">
						극장을 선택하세요
					</p>
					<!--선택했을 경우 클릭하면 입력되고 아니면 열리지 않는다.-->
					<div class="check-theater" style="display: none;"></div>
				</div>
			</div>
			</div>
		</div>
		
		<!------------------------------ 날짜 ------------------------------>
		<div style="width:33%; height:700px;">
			<div class="right-one">
				<h3 class="align-center" style="width:100%; height:40px; background-color:black; color:white;">시간</h3>
				<div class="time-check"></div>
				<div class="movie-check"></div>
			</div>
		</div>
	</div>
</body>
</html>
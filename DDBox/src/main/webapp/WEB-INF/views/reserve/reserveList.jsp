<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	   <div class="container" style="width: 1250px;">
        <div class="row mb-3">
            <div class="col">
                <h2>빠른 예매</h2>
            </div>
        </div>
        <%-- <div class="col-10">
            <div class="my-box">
                <div class="day">
                    <!-- 페이지 네이션으로 입력할 것 -->
                    <!--일에 따라서 class가 바뀐다. -->
                    <div class="month"></div>
                   	<div class="now-day">
                   	</div>
                </div>
                
                <div class="movie-container">
                <div class="left-one">
                    <h3>영화</h3>
                    <div class="movie-name">
                        <button class="movie-name-button" type="button">전체</button>
                    </div>
                    <div class="movie-list">
	                    <c:choose>
	                    	<c:when test="${param.no eq 0}">
	                    		<c:forEach var="movie" items="${movies}">
			                    	<button class="movie-button" type="button" value="${movie.movieNo}" >
			                            <img src="${movie.ratingImageURL} " alt="${movie.ratingName}"/>
			                            <span class="txt">${movie.movieName}</span>
			                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
			                        </button>
			                    </c:forEach>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<c:forEach var="movie" items="${movies}">
			                    	<button class="movie-button ${movie.movieNo eq param.no ? 'active' : '' }" type="button" value="${movie.movieNo}"  >
			                            <img src="${movie.move_poster} " alt="${movie.move_poster}"/>
			                            <span class="txt">${movie.movie_title}</span>
			                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
			                        </button>
			                    </c:forEach>
	                    	</c:otherwise>
	                    </c:choose>
                    </div>
                    <div class="movie-img">
                        <div class="choice-list" id="choiceMovieList-0">
                        	<img id="picture" alt="no-pricture" src="/resources/images/movie/no-graph03.jpg">
                        	<p id="picture-name">영화를 클릭하세요</p>
                        </div>
                    </div>
                </div>
                
                <div class="center-one">
                    <h3>극장</h3>
                    <div class="theater-list">
                        <button class="theater-all-button">전체</button>
                        <div class="theater-spacial-button"></div>
                    </div>
                    <div class="list-theater-detail">
                        <div class="all-theater-list">
                         	<div class="explain-button">
                         		<p style="display:flex">영화를 선택하세요</p>
                         		<c:forEach var="region" items="${regions }">
	                        		<button class='list-theater-button' data-region='${region.no }' style="display:none">${region.name }</button>
	                        	</c:forEach>
                         	</div>
                        </div>
                        <div class="theater-choies">
                        
                        </div>
                    </div>
                    <div class="theater-choies-check">
                        <p class="check-content" style="display:flex;">전체극장<br>
                            목록에서 극장을 선택하세요
                        </p>
                        <!--선택했을 경우 클릭하면 입력되고 아니면 열리지 않는다.-->
                        <div class="check-theater" style="display:none;">
                        
                        </div>
                    </div>
                </div>
                <div class="right-one">
                    <h3>시간</h3>
                    <div class="time-check">
                    </div>
                    <div class="movie-check">
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="footer">
            <div class="advertise-footer">
                <img src="/resources/images/btn/광고.jpg" alt="advertisement">
            </div>
        </div> --%>
      </div>
</body>
</html>
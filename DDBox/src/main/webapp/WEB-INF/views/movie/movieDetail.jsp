<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 내용 시작 -->
    <title>영화 상세 페이지</title>
    <!-- 커스텀 CSS 추가 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movieDetail.css">


    <!-- 영화 상세 페이지 컨테이너 -->
<div class="movie-detail-page">

    <!-- 1번 영역: 영화 제목, 좋아요 버튼, 포스터, 예매 버튼 -->
    
    <div class="movie-content-area">
        <div class="movie-texts">
            <h1 class="movie-title-kr">${movie.movie_title}</h1>
            <h2 class="movie-title-en">${movie.movie_original_title}</h2>
            <button class="like-button">❤ 좋아요 0</button>
        </div>
        <div class="movie-booking-area">
            <img src="https://image.tmdb.org/t/p/w500/${movie.movie_poster}" alt="영화 포스터" class="movie-poster">
            <div></div>
            <button class="booking-button">예매하기</button>
        </div>
    </div>

	<!-- 2번 영역: 영화 tagline, 줄거리, 감독, 장르, 등급, 개봉일, 출연진 -->
    <div class="movie-info-area">
        <p class="tagline">${movie.movie_tagline}</p>
        <p class="summary">${movie.movie_overview } <button class="more-button">더보기</button></p>
        <div class="additional-info">
            <p>감독: Director Name</p>
            <p>장르: Genre</p>
            <p>등급: Rating</p>
            <p>개봉일: ${movie.movie_opendate }</p>
            <p>출연진: Cast Members</p>
        </div>
    </div>

    <!-- 3번 영역: 차트/그래프 예매자 남녀비율, 연령대 등 -->
    <div class="audience-stats-area">
        <p>예매자 남녀비율, 연령대 차트(예시)</p>
    </div>

    <!-- 4번 영역: 사용자 리뷰 및 평점 -->
    <div class="user-reviews-area">
        <h3>사용자 리뷰 및 평점</h3>
        <div class="review-form">
            <!-- AJAX로 처리될 리뷰 폼 -->
        </div>
        <div class="reviews-list">
            <!-- 사용자 리뷰 목록 -->
        </div>
    </div>

</div>

    
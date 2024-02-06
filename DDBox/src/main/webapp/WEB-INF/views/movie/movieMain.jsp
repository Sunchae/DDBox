<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- 내용 시작 -->
<h1>영화 메인 페이지</h1>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
/* 추가적인 스타일링을 위한 부분 */
.movie-lists {
    margin-bottom: 20px;
    position: relative;
    overflow: hidden;
}

.movie-poster {
    transition: filter 0.3s ease-in-out;
}

.movie-lists .movie-summary {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 80%; /* 영화 요약의 폭을 조절하세요 */
    display: none;
    background: rgba(255, 255, 255, 0.9);
    padding: 20px;
    text-align: center;
}

.movie-lists:hover .movie-poster {
    filter: blur(10px);
}

.movie-lists:hover .movie-summary {
    display: block;
}

/* 일반적인 포스터 링크 스타일 */
.poster-link {
    text-decoration: none; /* 링크 밑줄 제거 */
    cursor: pointer;  /* 포인터로 변경 */
    position: relative; /* 상대적 위치 설정 */
}

/* 포스터가 hover 되었을 때 스타일 변경 */
.poster-link:hover .movie-poster {
    filter: brightness(90%); /* 밝기를 줄여서 포스터 어둡게 만들기 (선택 사항) */
}

/* 링크를 감싸는 레이어에 클릭 이벤트를 추가 */
.poster-link .event-layer {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    pointer-events: auto;  /* 링크 레이어에 클릭 이벤트 활성화 */
    z-index: 2; /* 링크 레이어를 다른 요소 위에 표시되도록 함 */
}
/* 좋아요 버튼 스타일 */
.like-button {
    display: inline-block; /* 항상 표시됨 */
}
</style>

<div class="container">
    <div class="row">
        <c:forEach var="movie" items="${list}">
            <div class="col-md-4">
                <div class="movie-lists">
                    <!-- 링크를 감싸는 레이어 -->
                    <a href="/movie/movieDetail?movie_num=${movie.movie_num}"
                        class="poster-link">
                        <!-- 이벤트를 적용한 레이어 -->
                        <div class="event-layer"></div>
                        <img src="https://image.tmdb.org/t/p/w500/${movie.movie_poster}"
                            class="img-fluid movie-poster" alt="${movie.movie_title} Poster">
                        <div class="movie-summary">
                            <h5>${movie.movie_title}</h5>
                            <p>${movie.movie_overview}</p>
                        </div>
                    </a>

                    
                </div>
                <div class="movie-details">
                        <div>
                            <p>등급: ${movie.movie_gradeNm}</p>
                            <p>예매율: ${movie.movie_popularity}</p>
                            <p>개봉일: ${movie.movie_opendate}</p>
                        </div>
                        <div>
                            <!-- 좋아요 기능 추가 필요 -->
                            <button class="btn  btn-sm">좋아요</button>
                            <!-- 예매페이지로 링크 필요 -->
                            <button class="btn btn-primary btn-sm">예매하기</button>
                        </div>
                    </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 내용 끝 -->

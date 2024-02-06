<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- Main1 내용 시작 -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* 추가적인 스타일링을 위한 부분 */
        .carousel-item img {
            height: 400px; /* 캐러셀 이미지 높이 조절 */
            object-fit: cover; /* 이미지 비율 유지 */
        }
    </style>
<body>
    <div class="container mt-5">
        <!-- 캐러셀 영역 -->
        <div id="movieCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <!-- 캐러셀 아이템들 -->
                <div class="carousel-item active">
                    <img src="https://via.placeholder.com/800x400" class="d-block w-100" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>영화 제목 1</h5>
                        <p>영화 소개</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://via.placeholder.com/800x400" class="d-block w-100" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>영화 제목 2</h5>
                        <p>영화 소개</p>
                    </div>
                </div>
                <!-- 추가적인 캐러셀 아이템들 -->
                <!-- 이 부분을 필요한 만큼 복사하여 추가할 수 있습니다 -->
            </div>
            <!-- 이전/다음 버튼 -->
            <a class="carousel-control-prev" href="#movieCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#movieCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <!-- 영화 목록 -->
        <div class="row mt-5">
           
            <%-- 영화 목록 반복 출력 --%>
            <c:forEach var="movie" items="${list}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://image.tmdb.org/t/p/w500/${movie.movie_poster}" class="card-img-top" alt="Movie Poster" style="width: 100%; height: 90%; object-fit: contain;">
                        <div class="card-body">
                            <h5 class="card-title">${movie.movie_title}</h5>
                            <p class="card-text">${movie.movie_tagline}</p>
                            <a href="/movie/movieDetail?movie_num=${movie.movie_num}" class="btn btn-primary">영화 상세 정보</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Main1 내용 끝 -->

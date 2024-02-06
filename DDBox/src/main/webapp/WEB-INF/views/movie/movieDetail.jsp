<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 내용 시작 -->
    <title>영화 상세 페이지</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가 -->
    <link rel="stylesheet" href="styles.css">


    <!-- 1번 영역 -->
    <div class="container-fluid movie-header">
        <div class="row">
            <div class="col-md-4">
                <img src="https://image.tmdb.org/t/p/w500/${movie.movie_poster}" alt="영화 포스터" class="img-fluid">
            </div>
            <div class="col-md-8">
                <div class="movie-info">
                    <h1>${movie.movie_title }</h1>
                    <p>${movie.movie_original_title}</p>
                    <p>좋아요 수: 100</p>
                    <p>예매율: 80%</p>
                    <p>누적 관객수: 1,000,000명</p>
                </div>
            </div>
        </div>
    </div>

    <!-- 2번 영역 -->
    <div class="container movie-details">
        <h2>영화에 대한 상세 정보</h2>
        <p>${movie.movie_overview }</p>
        <p>감독: 감독의 이름</p>
        <p>장르: 액션, 드라마</p>
        <p>등급: 15세 관람가</p>
        <p>${movie.movie_opendate }</p>
        <p>출연진: 배우1, 배우2, 배우3</p>
        <!-- 기타 필요한 상세 정보 추가 -->
    </div>

    <!-- 3번 영역 -->
    <div class="container movie-graphs">
        <h2>각종 데이터 그래프</h2>
        <!-- 방사형 그래프, 성비 퍼센트 그래프 등 추가 -->
    </div>

    <!-- 4번 영역 -->
    <div class="container user-reviews">
        <h2>사용자 리뷰 및 평가</h2>
        <!-- 사용자가 남긴 관람평과 평가 점수 표시 -->
        <div class="row">
            <div class="col-md-6">
                <div class="user-review">
                    <p>사용자1의 평가: 4.5/5</p>
                    <p>관람평: 영화가 정말 좋았어요!</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="user-review">
                    <p>사용자2의 평가: 3.8/5</p>
                    <p>관람평: 기대 이상이었습니다.</p>
                </div>
            </div>
        </div>
        <!-- 기타 사용자 리뷰 추가 -->
    </div>

    <!-- 부트스트랩 JS 및 기타 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


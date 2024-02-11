<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 내용 시작 -->
    <title>영화 상세 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movieDetail.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <!-- 영화 상세 페이지 컨테이너 -->
<div class="movie-detail-page">

    <!-- 1번 영역: 영화 제목, 좋아요 버튼, 포스터, 예매 버튼 -->
    <div class="movie-content-area">
        <div class="movie-texts">
            <h1 class="movie-title-kr">${movie.movie_title}</h1>
            <h2 class="movie-title-en">${movie.movie_original_title}</h2>
			<button class="like-button" data-num="${movie.movie_num}">
				<img src="" class="heart-icon" alt="좋아요">
				<span class="likes-count">${likesCount}</span>
			</button>
		</div>
        <div class="movie-booking-area">
            <img src="https://image.tmdb.org/t/p/w500/${movie.movie_poster}" alt="영화 포스터" class="movie-poster">
            <div></div>
            <a href="/reserve/reserveMain" ><button class="booking-button">예매하기</button></a>
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
<script>
$(document).ready(function() {
    var movieNum = $('.like-button').data('num'); // 영화 번호를 변수에 저장

    // 페이지 로드 시 좋아요 상태 확인
    checkLikeStatus(movieNum);

    // 좋아요 버튼 클릭 이벤트
    $('.like-button').on('click', function() {
        var $this = $(this); // 현재 클릭된 버튼을 $this 변수에 할당

        // 좋아요 토글 요청
        $.ajax({
            url: '/movie/toggleLike',
            type: 'POST',
            dataType: 'json',
            data: { movie_num: movieNum },
            success: function(param) {
               if(param.status == "logout"){
            	   alert(param.message);
            	   window.location.href="/member/login";//로그인 페이지로 이동
               }else{
            	
            	var heartIcon = $this.find('.heart-icon');
                var likesCountSpan = $this.find('.likes-count');

                if(param.liked) {
                    heartIcon.attr('src', '${pageContext.request.contextPath}/images/movie/채워진하트.png'); // 채워진 하트 이미지로 변경
                } else {
                    heartIcon.attr('src', '${pageContext.request.contextPath}/images/movie/빈하트.png'); // 빈 하트 이미지로 변경
                }
                likesCountSpan.text(param.likesCount); // 좋아요 개수 업데이트
               }
            },
            error: function() {
                alert('좋아요 처리 중 오류가 발생했습니다.');
            }
        });
    });
});

// 페이지 로드 시 현재 사용자의 좋아요 상태 확인 함수
function checkLikeStatus(movieNum) {
    $.ajax({
        url: '/movie/checkLikeStatus',
        type: 'POST',
        dataType: 'json',
        data: { movie_num: movieNum },
        success: function(response) {
            var heartIcon = $('.like-button').find('.heart-icon');
            if(response.status === "liked") {
                heartIcon.attr('src', '${pageContext.request.contextPath}/images/movie/채워진하트.png');
            } else {
                heartIcon.attr('src', '${pageContext.request.contextPath}/images/movie/빈하트.png');
            }
        },
        error: function() {
            console.error('좋아요 상태 확인 중 오류 발생');
        }
    });
}


</script>

    
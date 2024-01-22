<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 시작 -->
<div class="page-main">
	<h1>영화 메인 페이지</h1>
	<script type="text/javascript">
	$(function() {
		
		var errorModal = new bootstrap.Modal(document.getElementById("modal-info-error"), {
			keyboard: false
		});
		
		let apiKey = "fa44f7ba22e7b7a5a7d41d6feaf39cea";
		let imageUrl = "https://image.tmdb.org/t/p/w500/";
		let $div = $(".poster");
		
		showTop4();
		
		function showTop4() {
			$.getJSON('/rest/top4', function(response) {

				$.each(response, function(index, movie) {

					let detailUrl = "https://api.themoviedb.org/3/movie/" + movie.no;
					let poster = "";
					
					$.ajax({
						type: "get",
						url: detailUrl,
						data: {"api_key": apiKey, language: "ko-KR"},
						async: false,
						success: function(response) {
							poster = imageUrl + response.poster_path;
						}
					})
					
					let output = "";
					
					output += "<div class='col-3 mt-5 mb-5' style='padding-left: 0px;'>";
					output += "<a href='/movie/detail?no="+movie.no+"'>";
					output += "<img src = '"+poster+"'class='rounded card-img-top' style='width: 17rem; height:440px;'/>";
					output += "</a>";
					output += "<div class='d-flex mt-3'>";
					output += "<button id='btn-"+ movie.no +"' class='btn btn-outline-light btn-like col-5 mt-1 float-end' data-no='"+ movie.no +"' type='button' style='margin-right: 15px;'><img class='me-3' src='/resources/images/movie/unlike.png'><span>"+movie.likeCount+"</span></button>";
					output += "<button data-no='"+ movie.no +"' type='button' class='btn btn-primary col-5 mt-1 float-end'><a href='/ticketing/screenList?no="+movie.no+"'>예매</a></button>";
					output += "</div>";
					output += "</div>";
					
					showMyMovies();
					$div.append(output);
				})
			});
		}
		
		showMyMovies();
		
		$(".poster").on('click', '.btn-like', function() {
			
			let movieNo = $(this).attr("data-no");
			let button = $(this);
			let unlike = "/resources/images/movie/unlike.png";
			let like = "/resources/images/movie/like.png";
			
			if (button.find('img').attr('src') == unlike) {
				
				$.ajax({
					type: "post",
					url: "/rest/like",
					data: {movieNo: movieNo},
					datType: "json",
					success: function(response) {
						if (response.error) {
							$("#span-error").text(response.error);
							errorModal.show();
							
							$("#submit").click(function() {
								errorModal.hide();
							})
							
							return;
						}
						button.find('span').text(response.items.likeCount);
						button.find('img').attr("src", like);
					}
				})
			} else {
				$.ajax({
					type: "delete",
					url: "/rest/like",
					data: {movieNo: movieNo},
					datType: "json",
					success: function(response) {
						button.find('span').text(response.items.likeCount);
						button.find('img').attr("src", unlike);
					}
				})
			}
		});
	})
</script>
</div>
<!-- 내용 끝 -->

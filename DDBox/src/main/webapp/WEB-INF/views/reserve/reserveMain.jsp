<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PIH.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/reserve.region.js"></script>
</head>
<body>
	<div class="row mb-3">
		<div class="col">
			<h2>빠른 예매</h2>
		</div>
	</div>
	<div class="col-10">
		<div class="day">
			<!-- 페이지 네이션으로 입력할 것 -->
			<!--일에 따라서 class가 바뀐다. -->
			<div class="month"></div>
			<div class="now-day"></div>
		</div>
	</div>
	<div style="display:flex; font-size:13pt;">
		<!------------------------------ 양화 ------------------------------>
		<div style="width:30%; height:700px;">
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
							<li id="movie_choice"><a>${reserve.movie_title}</a></li>
						</ul>
					</c:forEach>
					
				</div>
				<div class="movie-img">
					<div class="choice-list" id="choiceMovieList-0">
						<img id="picture" src="${reserve.movie_poster}">
						<p class="align-center" id="picture-name" style="border-style:dotted">영화를 클릭하세요</p>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<!-- li 클릭시 영화 제목+포스터 출력& 해당 영화가 상영되고 있는 극장 -->
		
		<!------------------------------ 극장 ------------------------------>
		<div style="width:37%; height:700px;">
			<div class="v-line" style="border-right: 3px solid #ccc; height:100%; left: 50%;">
			<div class="center-one">
				<h3 class="align-center" style="width:100%; height:40px; background-color:black; color:white;">극장</h3>
					<div class="all-theater-list">
						<div class="search_boxes" style="display:flex; height:600px;">
							<div class="search_box" >
								<select style="overflow-y: hidden;"size="9" name="do" id="do" onchange="categoryChange(this)">
									<option value="general01">서울</option>
									<option value="general02">경기</option>
									<option value="general03">인천</option>
									<option value="general04">강원</option>
									<option value="general05">대전/충청</option>
									<option value="general06">대구</option>
									<option value="general07">부산/울산</option>
									<option value="general08">경상</option>
									<option value="general09">광주/전라/제주</option>
								</select>
							</div>

							<div class="search_box">
								<select size="20" name="state" id="state">
									<option id="region_choice" value="0general01"></option>
								</select>
							</div>
						</div>
					</div>
					<div class="theater-choies"></div>
				<!-- 영화관 선택하지 않았을 때 -->
				<div class="theater-choies-check" style="display:block;">
					<p class="check-content align-center"  style="border-style:dotted">
						목록에서 극장을 선택하세요
					</p>
					<!--선택했을 경우 클릭하면 입력되고 아니면 열리지 않는다.-->
					<div class="check-theater" style="display: none;">
						
					</div>
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
	
<script type="text/javascript">
const dataDate = new Date();
let year = dataDate.getFullYear();
let month = dataDate.getMonth();
let dataDay = dataDate.getDate();
let dayLabel = dataDate.getDay();
let dayNumber = Number(dataDay);
$('div.month').text((Number(month)+1)+"월");

const reserveDate = $('div.now-day');

const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
let thisWeek = [];
let button = "";
let spanWeekOfDay = "";
let spanDay = "";
let div = "";
for(let i = dayNumber ; i<=dayNumber+11 ; i++) {
	
	div = document.createElement("div");
	button = document.createElement("button");
	spanWeekOfMonth = document.createElement("span");
	spanWeekOfDay = document.createElement("span");
	spanDay = document.createElement("strong");
	spanWeekOfMonth.classList="movie-week-of-month";
	spanWeekOfDay.classList = 'movie-week-of-day';
	spanDay.classList ='movie-day';
	let resultDay = new Date(year, month, i);
	let yyyy = resultDay.getFullYear();
	let mm = Number(resultDay.getMonth())+1;
	let dd = resultDay.getDate();
	let d = resultDay.getDay();
	
	mm = String(mm).length === 1 ? '0'+mm : mm;
	dd = String(dd).length === 1 ? '0'+dd : dd;
	d = String(d).length === 1 ? '0'+d : d;
	spanWeekOfMonth.innerHTML = mm;
	spanWeekOfDay.innerHTML = dd;
	
	button.append(spanWeekOfDay);
	if(d == '01'){
		d=weekOfDay[1];
		button.classList = "mon";
		button.setAttribute('data-day',yyyy+mm+dd+d);
	} else if(d == '02'){
		d=weekOfDay[2];
		button.classList = "mon";
		button.setAttribute('data-day',yyyy+mm+dd+d);
	} else if(d == '03'){
		d=weekOfDay[3];
		button.classList = "mon";
		button.setAttribute('data-day',yyyy+mm+dd+d);
	} else if(d == '04'){
		d=weekOfDay[4];
		button.classList = "mon";
		button.setAttribute('data-day',yyyy+mm+dd+d);
	} else if(d == '05'){
		d=weekOfDay[5];
		button.classList = "mon";
		button.setAttribute('data-day',yyyy+mm+dd+d);
	} else if(d == '06'){
		d=weekOfDay[6];
		button.classList ="mon sat";
		button.setAttribute('data-day',yyyy+mm+dd+d);
	} else if(d == '00'){
		d=weekOfDay[0];
		button.classList="mon sun";
		button.setAttribute('data-day',yyyy+mm+dd+d);
	}
	if(i===dayNumber){
		button.classList="mon active";
		//해당날짜는 버튼이 눌려있게 설정함
	}
	spanDay.innerHTML = d;
	button.append(spanDay);
	reserveDate.append(button);
	
	
	thisWeek[i] = yyyy + "-" + mm +'-' +dd +'-'+d ;
}

//날짜 클릭시 활성화 버튼과 hidden으로 data값 전송
$('div.now-day').on('click','button.mon',function(){
	let $btnActive = $(this);
	let dataAttr = $btnActive.attr('data-day');
	if($btnActive.hasClass('active')){
		$('button.mon').removeClass('active');
	} else{
		$('button.mon').removeClass('active');
		$btnActive.addClass('active');
	}
});
//날짜 클릭했으면 활성화버튼 해제 

</script>	
</body>
</html>
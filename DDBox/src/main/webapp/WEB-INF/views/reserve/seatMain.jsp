<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie Booking</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ticketingList.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap" rel="stylesheet">
<style type="text/css">
	body{
    font-family: 'Lato', sans-serif;
    color: #fff;
    box-sizing: border-box;
}
#container{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 800px;
}

.movieContainer{
    margin: 20px 0px;
}

.showcase{
    background-color: #777;
    background: rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    display: flex;
    justify-content: center;
    margin: 16px 0;
    padding: 5px 10px;
}

.movieContainer select{
    margin: 10px;
    padding: 5px 15px 5px 15px;
    border-radius: 7px;
    appearance: none;
    border: 0;
}

.movieContainer select option{

   text-align: left;
}

li{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 10px;
}

.small{
    color: #777;
    margin-left: 2px;
}

.showcase .seat:hover{
    cursor: default;
    scale: 1;
}

.showcase .selectedSeat:hover{
    cursor: default;
    scale: 1;
}

.screen{
   background-color: #fff;
   margin: 25px;
   padding: 5px;
   width: 200px;
   height: 80px;
   transform: rotateX(-45deg);
   box-shadow: 0 3px 10px rgb(255 255 255 / 70%);
}

.seat{
    background-color: #444451;
    width: 15px;
    height: 12px;
    margin: 3px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    cursor: pointer;
    font-size:7pt;
}

.availableSeat{
    background-color: #444451;
    width: 15px;
    height: 12px;
    margin: 3px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    cursor: default;
}

.selectedSeatIcon{
    background-color: #6feaf6;
    width: 15px;
    height: 12px;
    margin: 3px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    cursor: default;
}

.seat:hover{
    scale: 1.2;
}

.selectedSeat:hover{
    scale: 1.2;
}

.seat:nth-of-type(2){
    margin-right: 18px;
}

.seat:nth-of-type(7){
    margin-left: 18px;
}

.occupiedSeat:nth-of-type(2){
    margin-right: 18px;
}
.occupiedSeat:nth-of-type(7){
    margin-left: 18px;
}

.selectedSeat{
    background-color: #6feaf6;
    width: 15px;
    height: 12px;
    margin: 3px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    cursor: pointer;
    font-size:7pt;
    color:white;
}

.occupiedSeat{
    background-color: #fff;
    width: 15px;
    height: 12px;
    margin: 3px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    font-size:7pt;
    color:black;
}

.row{
    display: flex;
}

.text{
    margin-top: 30px;
    padding: 20px;
}

#count{
    color: #6feaf6;
}

#costs{
    color: #6feaf6;
}
.all-check-people{
	display: flex;
    width: 70%;
    margin-left: 10%;
    margin-top: 25px;
    height: 10%;
	top: 20px;
}
.check-people-box{
	position:relative;
	display: flex;
	width:10px;
	margin-left: 10%;
} 
.check-people{
	float:left;
    display:flex;
    clear:both;
    width: 20%;
    height: 40px;
    border-top: 1px solid rgb(238, 241, 255);
    background-color: rgb(238, 241, 255);
}
.txt{
    float: left;
    text-align: center;
    font-size: small;
    margin-right: 20px;
    margin-top: 10px;
}
.down,.up{
    width: 18.2px;
    height: 22px;
    border-radius: 3px;
    margin-top: 10px;
    position: sticky;
}

.now{
    width: 20px;
    height: 22px;
    margin-top: 10px;
    position: sticky;
    
}
.down,.now,.up{
    float: left;
    border: 1px solid rgb(197, 196, 196);
    background-color: white;
    margin-top: 5px;

}
.count{
    font-size: 10px;
    color: rgb(160, 160, 160);
    text-align: left;
}
ul {
    list-style:none;
    margin:0;
    padding:10;
}

li {
	padding: 20;
	mragin: 0;
    float: left;
}
</style>
</head>

<body>
	<div id="container" style="border:1px solid black;  background-color: #4a4777;">
		<div class="movieContainer">
			<label for="movie"> 관람인원선택 : </label> 
			<select name="pickMovie" id="movie">
				<option class="price" value="15000">일반</option>
				<option class="price" value="12000">청소년</option>
			</select>
		</div>
		
			<div class="check-people-box">
              <div class="check-people">
                    <p class="txt">성인</p>
                    <div class="count">
                        <button type="button" class="down" title="성인 좌석 선택 감소">-</button>
                        <div class="number">
                            <button type="button" class="now" title="성인 현재 좌석 선택 수">0</button>
                        </div>
                        <button type="button" class="up" title="성인 좌석 선택 증가">+</button>
                    </div>
                </div>
                
                <div class="check-people">
                    <p class="txt">청소년</p>
                    <div class="count">
                        <button type="button" class="down" title="청소년 좌석 선택 감소">-</button>
                        <div class="number">
                            <button type="button" class="now" title="청소년 현재 좌석 선택 수">0</button>
                        </div>
                        <button type="button" class="up" title="청소년 좌석 선택 증가">+</button>
                    </div>
                </div>
            </div>
		<p></p>
		<p></p>
		<p></p>
		<ul class="showcase">
			<li>
				<div class="availableSeat"></div> <small class="small">선택가능</small>
			</li>
			<li>
				<div class="selectedSeatIcon"></div> <small class="small">선택한 좌석</small>
			</li>
			<li>
				<div class="occupiedSeat"></div> <small class="small">예매완료</small>
			</li>
		</ul>

		<div class="seatContainer">
			<div class="screen"></div>
			
			
			<div class="row">A
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span>
				<span class="seat">6</span> 
				<span class="seat">7</span> 
				<span class="seat">8</span>
			</div>
			
			<div class="row">B
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span>
				<span class="seat">6</span> 
				<span class="seat">7</span> 
				<span class="seat">8</span>
			</div>
			
			<div class="row">C
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span>
				<span class="seat">6</span> 
				<span class="seat">7</span> 
				<span class="seat">8</span>
			</div>

			<div class="row">D
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="occupiedSeat">5</span> 
				<span class="occupiedSeat">6</span> 
				<span class="seat">7</span> 
				<span class="seat">8</span>
			</div>

			<div class="row">E
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span>
				<span class="seat">6</span> 
				<span class="occupiedSeat">7</span> 
				<span class="seat">8</span>
			</div>

			<div class="row">F
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span>
				<span class="seat">6</span> 
				<span class="occupiedSeat">7</span> 
				<span class="occupiedSeat">8</span>
			</div>

			<div class="row">G
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span>
				<span class="seat">6</span> 
				<span class="seat">7</span> 
				<span class="seat">8</span>
			</div>
			
			<div class="row">H
				<span class="seat">1</span> 
				<span class="seat">2</span> 
				<span class="seat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span>
				<span class="seat">6</span> 
				<span class="seat">7</span> 
				<span class="seat">8</span>
			</div>
			
			<div class="row">I
				<span class="seat">1</span> 
				<span class="occupiedSeat">2</span> 
				<span class="occupiedSeat">3</span> 
				<span class="seat">4</span> 
				<span class="seat">5</span> 
				<span class="seat">6</span> 
				<span class="occupiedSeat">7</span> 
				<span class="seat">8</span>
			</div>

		</div>
		
	<div>
		<p class="text">
			<span id="count">0</span>명 최종결제금액 <span id="costs">0</span>
		</p>
	</div>
	<div class="align-center">
		<input type="submit" value="결제하기" onclick="location.href='payMain'">
	</div>	
	
	<!-- <div class="wrap">
		<div class="tit-area">
			<span class="tit"></span>
		</div>
		<div class="info-area">
			<p class="theater"></p>
			<p class="date"></p>
			<p class="poster"></p>
		</div>
		<div class="legend">
			
		</div>
		<div class="seat-num">
			<div class="seat-all" title="구매가능 좌석">-</div>
			<div class="seat-all" title="구매가능 좌석">-</div>
			<div class="seat-all" title="구매가능 좌석">-</div>
			<div class="seat-all" title="구매가능 좌석">-</div>
			<div class="seat-all" title="구매가능 좌석">-</div>
			<div class="seat-all" title="구매가능 좌석">-</div>
			<div class="seat-all" title="구매가능 좌석">-</div>
			<div class="seat-all" title="구매가능 좌석">-</div>
		</div>
		<div class="pay-area">
			<p class="text">
			최종결제금액 
			<span id="costs">0</span>
			</p>
		</div>
	</div> -->
	</div>
	

	<script>
        document.addEventListener('DOMContentLoaded', () =>{

const seatContainer = document.querySelector('.seatContainer');

const movie = document.getElementById('movie'); // 선택할 영화
let moviePrice = Number(movie.value); // 영화과격 

let count = document.querySelector('#count'); // 인원수
let costs = document.querySelector('#costs'); // 가격

// 선택한 좌석수 텍스트 변경해주기

function countSeatPrice(){
    const selectedSeatCount = document.querySelectorAll('.selectedSeat').length;

    count.textContent = selectedSeatCount;
    costs.textContent = selectedSeatCount * moviePrice;
    
}


//좌석 클릭했을때

seatContainer.addEventListener('click', (e) => {

    if(e.target.className === 'seat'){
        e.target.className = 'selectedSeat';
    } else if(e.target.className === 'selectedSeat'){
        e.target.className = 'seat';
    }

    countSeatPrice();
})

// 영화 변경할때

movie.addEventListener('change', (e) => {

    moviePrice = Number(e.target.value);

    countSeatPrice()
    
})




})
    </script>
</body>

</html>
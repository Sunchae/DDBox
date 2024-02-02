<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie Booking</title>
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
/* #ticket .section-numberofpeople .col-body .numberofpeople-select .group ul {
    float: left;
    width: auto;
    height: 22px;
    line-height: 22px;
    overflow: hidden;
}
#ticket .section-numberofpeople .col-body .numberofpeople-select .group ul li {
    width: 20px;
    height: 20px;
    line-height: 20px;
    border: 1px solid #d6d3ce;
    background-color: #f2f0e5;
}
#ticket .section-numberofpeople .col-body .numberofpeople-select .group ul li a {
    display: block;
    height: 100%;
    color: #333;
    font-family: Verdana;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
}
a {
    text-decoration: none;
    text-overflow: ellipsis;
    -o-text-overflow: ellipsis;
    color: #333;
}
#ticket .section-numberofpeople .col-body .numberofpeople-select .group ul li.selected a {
    margin: 1px;
    border: 1px solid #5c5c5c;
    width: 16px;
    height: 16px;
    line-height: 16px;
}
#ticket .section-numberofpeople .col-body .numberofpeople-select .group ul li.selected a {
    color: #fff;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
} */
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
			<label for="movie"> Pick a Movie : </label> 
			<select name="pickMovie" id="movie">
				<option class="price" value="10">Avengers:Endgame ($10)</option>
				<option class="price" value="12">Joker ($12)</option>
				<option class="price" value="8">Toy Story 4 ($8)</option>
				<option class="price" value="9">The Lion King ($9)</option>
			</select>
		</div>
		<div class="person_screen">
			<div class="section section-numberofpeople">
				<div class="col-body">
					<div class="numverofpeople-select" id="nopContainer" style="min-width: 426px;">
						<div id="maximum-people" style="padding-bottom: 5px; text-align:right; font-size:11px; !important; color:red;"> * 최대 8명 선택 가능</div>
						<div class="group adult" id="nop_group_adult" style="display:block;">
							<span class="title">일반</span>
							<ul>
								<li data-count="0" class="selected" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">0명</span>
									</a>
								</li>
								<li data-count="1" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">1명</span>
									</a>
								</li>
								<li data-count="2" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">2명</span>
									</a>
								</li>
								<li data-count="3" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">3명</span>
									</a>
								</li>
								<li data-count="4" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">4명</span>
									</a>
								</li>
								<li data-count="5" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">5명</span>
									</a>
								</li>
								<li data-count="6" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">6명</span>
									</a>
								</li>
								<li data-count="7" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">7명</span>
									</a>
								</li>
								<li data-count="8" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">8명</span>
									</a>
								</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="group_child" id="nop_group_child" style="display:block;">
							<span class="title">청소년</span>
							<ul>
								<li data-count="0" class="selected" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">0명</span>
									</a>
								</li>
								<li data-count="1" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">1명</span>
									</a>
								</li>
								<li data-count="2" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">2명</span>
									</a>
								</li>
								<li data-count="3" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">3명</span>
									</a>
								</li>
								<li data-count="4" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">4명</span>
									</a>
								</li>
								<li data-count="5" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">5명</span>
									</a>
								</li>
								<li data-count="6" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">6명</span>
									</a>
								</li>
								<li data-count="7" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">7명</span>
									</a>
								</li>
								<li data-count="8" style="border:1px solid white;">
									<a href="#" onclick="return false;">
										<span style="cursor:pointer; color:white; font-size:12pt;">8명</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
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
			You have selected <span id="count">0</span> seats for a price of $ <span
				id="costs">0</span>
		</p>
	</div>	

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
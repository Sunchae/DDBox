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
         <c:if test="${!empty user && user.mem_auth==9}">
         <input type="button" value="상영정보 추가" onclick="location.href='reserveList'">
      </c:if>
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
      <div style="width:30%; height:850px;">
      <div class="v-line" style="border-right: 3px solid #ccc; height:850px; left: 50%;">
         <div class="left-one">
            <h3 class="align-center" style="width:100%; height:40px; background-color:black; color:white;">영화</h3>
            <div class="col-head align-center" >
               <a href="#" onclick="sortMovieByRank();return false;" id="movieSortRank-btn" class="button btn-rank selected">예매율순</a> 
               <a href="#" onclick="sortMovieByName();return false;" id="movieSortName-btn" class="button btn-abc">가나다순</a>
            </div>
            <div class="col-body" style="overflow-y: scroll; height:550px;" >
               <ul>
               <c:forEach var="reserve" items="${list}">
                  <li class="movie-choice" data-num="${reserve.movie_num}">${reserve.movie_title}</li>
               </c:forEach>
               </ul>
            </div>
            <p></p>
               <div class="movie-img">
                  <div class="choice-list" id="choiceMovieList-0" style="border:dotted;">
                     <img id="picture" src="${pageContext.request.contextPath}/images/noimage.png" width="75">
                      <b id="picture-name">영화를 클릭하세요</b>
                  </div>
               </div>
            </div>
      </div>
      </div>
      <script type="text/javascript">
          let choice_num;
          let choice_screen;
          let choice_date;
        
         //날짜 클릭
         $(document).on('click','.mon',function(){
            choice_date = $(this).attr('data-day');
            alert('선택한 날짜 : ' + choice_date);
            
         //선택한 날짜에 해당하는 상영 정보 가져오는 함수 호출
         getMoviesByDate(choice_date);
         });
         //영화 클릭
          $(document).on('click','.movie-choice',function(){
             let movie_num = $(this).attr('data-num');
             choice_num = movie_num;
             selectMovie(movie_num);
         });
         //극장 클릭
         $(document).on('click','.each-screen',function(){
            let scr_num = $(this).attr('data-num');
            choice_screen = scr_num;
            selectScreen(scr_num);
            getMovieSchedule(choice_num,choice_screen,choice_date);
            
         })
         
         
         function selectMovie(movie_num){
         $.ajax({
             url: 'getMovie',
             type: 'get',
             data: {movie_num: movie_num},
             dataType: 'json',
             success: function(param){
                displaySelectedMovie(param);
                 displayScreen(param.list);
                  
             },
             error: function(){
                 alert('네트워크 오류 발생(영화선택)');
             }
         });
        }
         //영화관 선택 시 선택한 영화관 정보 출력
       function selectScreen(scr_num){
          $.ajax({
             url: 'getScreen',
             type: 'get',
             data: {scr_num:scr_num},
             dataType: 'json',
             success: function(param){
                displaySelectedScreen(param);
             },
             error: function(){
                alert('네트워크 오류 발생(극장선택)');
             }
          });
       }
       //영화 스케줄 가져오기위한 ajax통신
       function getMovieSchedule(choice_num,choice_screen,choice_date) {
           $.ajax({
               url: 'getMovieSchedule',  // 해당 URL은 실제로 서버에서 처리하는 URL로 변경해야 합니다.
               type: 'get',
               data: {
                   choice_num: choice_num,
                   choice_screen: choice_screen,
                   choice_date: choice_date
               },
               dataType: 'json',
               success: function (param) {
                   // 성공적으로 데이터를 받아왔을 때의 처리
                   displayMovieSchedule(param.scheduleList);
                   alert('scheduleList.shw_num : '+ param.scheduleList[0].shw_num);
               },
               error: function () {
                   // 오류 발생 시 처리
                   alert('네트워크 오류 발생(상영 시간표 조회)');
               }
           });
       }
         
         
       // 상영 시간표를 화면에 표시하는 함수
       function displayMovieSchedule(scheduleList) {
           let timeListContainer = $('.time-list');
            timeListContainer.empty();
            
           $.each(scheduleList, function(index, item) {
                  let output = '<li class="each-time" data-num="'+item.shw_num+'">';
                   output += item.shw_time;
                   output += '</li>';
                   timeListContainer.append(output);
                   
                   console.log(item);
            });           
           console.log(scheduleList);
        } 
         
         
         
         function getMoviesByDate() {
               $.ajax({
                   url: 'getMoviesByDate', // 서버에서 해당 날짜에 상영하는 영화 목록을 가져오는 엔드포인트
                   type: 'get',
                   data: { date : choice_date },
                   dataType: 'json',
                   success: function (param) {
                       console.log(param.movielist);
                      // 성공적으로 받은 영화 목록을 화면에 표시하는 함수 호출
                       displayMovies(param.movielist);
                       
                   },
                   error: function () {
                       alert('네트워크 오류 발생(날짜선택)');
                   }
               });
           }
         
         function displayMovies(movies){
            //영화 목록을 표시할 부분의 선택자를 지정
            let movieListContainer = $('.col-body');
            
            //이전에 표시된 영화목록 삭제
            movieListContainer.empty();
            
            //받아온 영화 목록을 반복하여 화면에 추가
            $.each(movies, function(index,movie){
              //각 영화에 대한 화면 출력 처리
              displayMovieItem(movie);
               
            });
               
            
         }
         //반복 돌려서 영화 리스트 출력하는 function 
         function displayMovieItem(movie) {
               let movieListContainer = $('.col-body');
           
               let output = '<li class="movie-choice" data-num="' + movie.movie_num + '">';
               output += movie.movie_title;
               //output += '<h3>' + movie.title + '</h3>';
               // 추가적인 영화 정보 표시 로직 작성
               output += '</li>';
               
               // movieListContainer에 영화 정보 추가
               movieListContainer.append(output);
           }
         
         
         //영화 클릭시 아래에 선택 영화 보여주는 function
         function displaySelectedMovie(param){
             let output;
             if(param.status == 'yesMovie'){
                 output = 'https://image.tmdb.org/t/p/w500/' + param.movieVO.movie_poster; 
             } else if(param.status == 'noMovie'){
                 output = '../resources/images/noimage.png';
             } else {
                 alert('영화 표시 오류 발생');
             }
             $('#picture').attr('src', output); 
             $('#picture-name').text(param.movieVO.movie_title); 
             console.log(param);
             
         }
      
         function displayScreen(list) {
               let screenList = $('.screen-list');
               screenList.empty(); // 기존 목록 제거
            
               //$(movie_num.list).each(function(index,item) {
               $.each(list, function(index, item) {   
                   let output = '<li class="each-screen" data-num="'+item.scr_num+'">';
                   output += item.scr_name;
                   output += '</li>';
                   screenList.append(output);
                   
                   console.log(item);
               });
               
           }
           //동적 생성된 영화관 클릭 했을 시 클릭한 영화관 이름 받아오고 싶음    
           $(document).on('click','.each-screen',function(){
              choice_screen = $(this).attr('data-num');
              console.log('choice_num : ' + choice_num);
              console.log('choice_screen : ' + choice_screen);
              console.log('choice_date : ' + choice_date);
            });       
           
           $(document).on('click','.screen-choice',function(){
                alert('영화를 먼저 선택하세요');
                
            });
           
               
          function displaySelectedScreen(param){
             //param.screen에 데이터 담겨 있음  아래에 마련된 공간에 데이터 비우고 영화관 이름 집어넣으면 됨
           let screenPick = $('.screen-name');
            screenPick.empty();
            
            let output = '<li class="selected-screen" data-num="'+param.screen.scr_num+'">';
                  output += param.screen.scr_name;
               output += '</li>';
            screenPick.append(output);
             
         }        
      
      
      </script>
      <!-- li 클릭시 영화 제목+포스터 출력& 해당 영화가 상영되고 있는 극장 -->
      
      <!------------------------------ 극장 ------------------------------>
      <div style="width:37%; height:700px;">
         <div class="v-line" style="border-right: 3px solid #ccc; height:100%; left: 50%;">
         <div class="center-one">
            <h3 class="align-center" style="width:100%; height:40px; background-color:black; color:white;">극장</h3>
               <div class="all-theater-list">
                  <div class="search_boxes" style="display:flex; height:600px;">
                     <div class="search_box" style="overflow-y: scroll; height:550px; width:300px;">
                        <ul class="screen-list">
                        <c:forEach var="reserve" items="${list3}">
                              <li class="screen-choice" data-num="${reserve.scr_num}">${reserve.scr_name}</li>
                        </c:forEach>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="theater-choies"></div>
            <!-- 영화관 선택하지 않았을 때 -->
            <div class="theater-choies-check" style="display:block;">
               <p class="check-content align-center"  style="border-style:dotted">
                  <b class="screen-name">목록에서 극장을 선택하세요</b>
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
            <div class="time-check">
               <ul class="time-list">
                  
               </ul>
            </div>
            <input type="button" value="좌석선택" onclick="location.href='seatMain'">
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
   $('div.month').text((Number(month) + 1) + "월");

   const reserveDate = $('div.now-day');

   const weekOfDay = [ "일", "월", "화", "수", "목", "금", "토" ];
   let thisWeek = [];
   let button = "";
   let spanWeekOfDay = "";
   let spanDay = "";
   let div = "";
   for (let i = dayNumber; i <= dayNumber + 11; i++) {

      div = document.createElement("div");
      button = document.createElement("button");
      spanWeekOfMonth = document.createElement("span");
      spanWeekOfDay = document.createElement("span");
      spanDay = document.createElement("strong");
      spanWeekOfMonth.classList = "movie-week-of-month";
      spanWeekOfDay.classList = 'movie-week-of-day';
      spanDay.classList = 'movie-day';
      let resultDay = new Date(year, month, i);
      let yyyy = resultDay.getFullYear();
      let mm = Number(resultDay.getMonth()) + 1;
      let dd = resultDay.getDate();
      let d = resultDay.getDay();

      mm = String(mm).length === 1 ? '0' + mm : mm;
      dd = String(dd).length === 1 ? '0' + dd : dd;
      d = String(d).length === 1 ? '0' + d : d;
      spanWeekOfMonth.innerHTML = mm;
      spanWeekOfDay.innerHTML = dd;

      button.append(spanWeekOfDay);
      if (d == '01') {
         d = weekOfDay[1];
         button.classList = "mon";
         button.setAttribute('data-day', yyyy +'-'+ mm +'-'+ dd);
      } else if (d == '02') {
         d = weekOfDay[2];
         button.classList = "mon";
         button.setAttribute('data-day', yyyy +'-'+ mm +'-'+ dd);
      } else if (d == '03') {
         d = weekOfDay[3];
         button.classList = "mon";
         button.setAttribute('data-day', yyyy +'-'+ mm +'-'+ dd);
      } else if (d == '04') {
         d = weekOfDay[4];
         button.classList = "mon";
         button.setAttribute('data-day', yyyy +'-'+ mm +'-'+ dd);
      } else if (d == '05') {
         d = weekOfDay[5];
         button.classList = "mon";
         button.setAttribute('data-day', yyyy +'-'+ mm +'-'+ dd);
      } else if (d == '06') {
         d = weekOfDay[6];
         button.classList = "mon sat";
         button.setAttribute('data-day', yyyy +'-'+ mm +'-'+ dd);
      } else if (d == '00') {
         d = weekOfDay[0];
         button.classList = "mon sun";
         button.setAttribute('data-day', yyyy +'-'+ mm +'-'+ dd);
      }
      if (i === dayNumber) {
         button.classList = "mon active";
         //해당날짜는 버튼이 눌려있게 설정함
      }
      spanDay.innerHTML = d;
      button.append(spanDay);
      reserveDate.append(button);

      thisWeek[i] = yyyy + "-" + mm + '-' + dd + '-' + d;
   }

   //날짜 클릭시 활성화 버튼과 hidden으로 data값 전송
   $('div.now-day').on('click', 'button.mon', function() {
      let $btnActive = $(this);
      let dataAttr = $btnActive.attr('data-day');
      if ($btnActive.hasClass('active')) {
         $('button.mon').removeClass('active');
      } else {
         $('button.mon').removeClass('active');
         $btnActive.addClass('active');
         
         
      }
   });

   
   
   //날짜 클릭했으면 활성화버튼 해제 

   /* //영화버튼 클릭시 극장 정보 가져오기
   $('#movie_choice').click(
         function() {
            let $movieButton = $(this);
            let valueNo = $movieButton.val();
            let texts = $movieButton.text();
            let attrNo = $movieButton.attr('class');
            $('button.list-theater-button').css('display', 'flex');
            $('#choiceMovieList-0').css('display', 'flex');
            if ($movieButton.hasClass('active')) {
               $('#movie_choice').removeClass('active');
               $('#picture').attr('src','/resources/images/noimage.png');
               $('#picture-name').text("영화를 선택하세요");
            } else {
               $('#movie_choice').removeClass('active');
               $movieButton.addClass('active');
               $('#picture-name').text(texts);
               let detailUrl = "https://image.tmdb.org/t/p/w500/" + movie_poster
               
               $.ajax({
                  type : 'get',
                  url : detailUrl,
                  data : {
                     "api_key" : "fa44f7ba22e7b7a5a7d41d6feaf39cea",
                     language : "ko-KR",
                     region : "KR"
                  },
                  dataType : 'json',
                  success : function(movie) {
                     $('#picture').attr('src', detailUrl);
                  }
               })
            }
            //아래에 클릭시 이미지가 뜨도록    
         })
   //해당하는 극장명이 출력된다. 
   $('button.list-theater-button')
         .click(
               function() {
                  let $dataAttr = $('div.theater-choies');
                  $dataAttr.empty();
                  let regionNo = $(this).attr('data-region');
                  $
                        .getJSON(
                              "/rest/theater",
                              {
                                 regionNo : regionNo
                              },
                              function(response) {
                                 $
                                       .each(
                                             response.items,
                                             function(index,
                                                   theater) {
                                                let output = "<button class='list-theater-button' data-theater="+theater.no+" title="+theater.name+">"
                                                      + theater.name
                                                      + "</button>"
                                                $dataAttr
                                                      .append(output);
                                             })
                              })
               })
   //극장명을 클릭하면   
   $('div.theater-choies')
         .on(
               'click',
               'button.list-theater-button',
               function() {
                  let $dataAttr = $('div.movie-check');
                  $('p.check-content').css('display', 'none');
                  $dataAttr.empty();
                  let $btn = $(this);
                  let texts = $btn.text();
                  if ($btn.hasClass('active')) {
                     $('button.list-theater-button').removeClass(
                           'active');
                     $('.check-theater').css('display', 'none');
                  } else {
                     $('button.list-theater-button').removeClass(
                           'active');
                     $btn.addClass('active');
                     $('.check-theater').text(texts);
                     $('.check-theater').css('display', 'flex');
                  }
                  let day = $('button.mon.active').find(
                        'span.movie-week-of-day').text();
                  let dayNm = parseInt(day);
                  let theaterNo = $btn.attr('data-theater');
                  let movieNo = $('button.movie-button.active').val();
                  let timeNo = $('.time-check-button:eq(0)').text();
                  let regionNo = $('.list-theater-button.active').attr(
                        'data-region');
                  let $theaterNames = $('div.theater-choies');
                  $
                        .getJSON(
                              '/rest/theaterList',
                              {
                                 movieNo : movieNo,
                                 theaterNo : theaterNo,
                                 timeNo : timeNo,
                                 dayNm : dayNm
                              },
                              function(response) {
                                 $
                                       .each(
                                             response.items,
                                             function(index,
                                                   theater) {
                                                let $list = $('div.theater-choies');
                                                let $movie = $('div.movie-check');
                                                if (theater.showTypeSubTitle == 'Y') {
                                                   theater.showTypeSubTitle = "자막(O)";
                                                } else {
                                                   theater.showTypeSubTitle = "자막(X)";
                                                }
                                                if (response.items == null) {
                                                   alert("해당하는 시간의 시간표가 존재하지 않습니다.");
                                                }
                                                let listputs = "<button class='theater-choies-button'>"
                                                      + theater.theaterName
                                                      + "</button>";
                                                $list
                                                      .append(listputs)

                                                //스케쥴에 출력되는 값 --> 나중에 시간설정 후 옮겨 놓을 것 
                                                let input = "<button type='button'  class='btn-on' value="+theater.showScheduleStartTime+" >";
                                                input += "<div class='legend' data-screenNo="+theater.screenNo+" data-showScheDuleNo="+theater.showScheduleNo+"></div>";
                                                input += "<span class='time'>";
                                                input += "<strong title='상영시작' data-time="+theater.showScheduleStartTime+"'>"
                                                      + theater.showScheduleStartTime
                                                      + "</strong>";
                                                input += "<em title='상영종료'>~"
                                                      + theater.showScheduleEndTime
                                                      + "</em>";
                                                input += "</span>";
                                                input += "<span class='title' data-regionNo="+theater.regionNo+">";
                                                input += "<strong data-movieNo="+theater.movieNo+">"
                                                      + theater.movieName
                                                      + "</strong>";
                                                input += "<em data-ratingNo="+theater.movieRatingNo+" data-showTypeNo="+theater.showTypeNo+">"
                                                      + theater.showTypeName
                                                      + theater.showTypeSubTitle
                                                      + "</em>";
                                                input += "</span>";
                                                input += "<div class='info'>";
                                                input += "<span class='theater' data-theaterNo="+theater.theaterNo+" title='극장'>";
                                                input += ""
                                                      + theater.theaterName
                                                      + "<br>";
                                                input += ""
                                                      + theater.screenName;
                                                input += "</span>";
                                                input += "<span class='seat'>";
                                                input += "<strong class='now' title='잔여좌석'>"
                                                      + theater.reservableSeat
                                                      + "</strong>";
                                                input += "<em class='all' title='"+theater.realTotalSeat+"'>/"
                                                      + theater.realTotalSeat
                                                      + "</em>";
                                                input += "</span>";
                                                input += "</div>";
                                                input += "</button>";
                                                $movie
                                                      .append(input);

                                             })
                              })
               })
   //시간출력하는 부분
   $('div.time-check').append(function() {
      let currentDate = new Date();
      let msg = Number(currentDate.getHours());
      for (let i = msg; i < msg + 10; i++) {
         let button = "";
         let $time = $('div.time-check');
         button = document.createElement("button");
         button.classList = 'time-check-button';
         if (i > 24) {
            button.innerHTML = Number();
         } else {
            button.innerHTML = Number(i);
            $time.append(button);
         }
      }
   })
   function timeAppend(event) {
      let day = $('div.mon.active').find('span.movie-week-of-day').text();
      let dayNm = parseInt(day);
      let mday = Number(currentDate.getDate());
      if (dayNm != mday) {
         for (let i = 1; i < 25; i++) {
            let button = "";
            let $time = $('div.time-check');
            button = document.createElement("button");
            button.classList = 'time-check-button';
            if (i > 24) {
               button.innerHTML = Number();
            } else if (i > 10) {
               button.innerHTML = Number("" + i);
               $time.append(button);
            } else {
               button.innerHTML = Number(i);
               $time.append(button);
            }
         }
      } else {
         let currentDate = new Date();
         let msg = Number(currentDate.getHours());
         for (let i = msg; i < msg + 10; i++) {
            let button = "";
            let $time = $('div.time-check');
            button = document.createElement("button");
            button.classList = 'time-check-button';
            if (i > 24) {
               button.innerHTML = Number();
            } else {
               button.innerHTML = Number(i);
               $time.append(button);
            }
         }
      }

   }
   //버튼 클릭시 정보저장하기
   $('div.movie-check')
         .on(
               'click',
               'button.btn-on',
               function(e) {
                  let $movie = $(this);
                  let movieNo = $movie.find('.title strong').attr(
                        'data-movieno');
                  let theaterNo = $movie.find('.theater').attr(
                        'data-theaterno');
                  let ratingNo = $movie.find('.title em').attr(
                        'data-ratingNo');
                  let showTypeNo = $movie.find('.title em').attr(
                        'data-showtypeno');
                  let screenNo = $movie.find('.legend').attr(
                        'data-screenno');
                  let regionNo = $movie.find('.title').attr(
                        'data-regionno');
                  let dayNo = $('button.mon.active').attr('data-day');
                  let showScheduleNo = $movie.find('.legend').attr(
                        'data-showScheDuleNo');
                  $('input[name=movieNo]').attr('value', movieNo);
                  $('input[name=theaterNo]').attr('value', theaterNo);
                  $('input[name=ratingNo]').attr('value', ratingNo);
                  $('input[name=time]').val($movie.val());
                  $('input[name=showTypeNo]').attr('value', showTypeNo);
                  $('input[name=screenNo]').attr('value', screenNo);
                  $('input[name=regionNo]').attr('value', regionNo);
                  $('input[name=day]').attr('value', dayNo);
                  $('input[name=showScheduleNo]').attr('value',
                        showScheduleNo);
                  $('#form-post-List').submit();
               }) */
</script>   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>회원 탈퇴</h2>
<form action="/member/withdraw" method="post">
    <div>
        <label for="mem_pw">비밀번호:</label>
        <input type="password" id="mem_pw" name="mem_pw" required>
    </div>
    <div>
        <label for="verification">4자리 숫자 입력:</label>
        <input type="text" id="verification" name="verification" pattern="\d{4}" title="4자리 숫자를 입력하세요" required>
        <button type="button" id="generateRandomNumber">난수 변경</button>
        <p id="randomNumber"></p>
    </div>
    <button type="submit">탈퇴하기</button>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>
   $(function(){
	   //난수 변경
	   $('#generateRandomNumber').click(function(){
		   get_randomNumber();
	   });
	   
	   function get_randomNumber(){
		   $.ajax({
			   url:'get_random',
		   	   type:'get',
		   	   dataType:'json',
		   	   success:function(param){
		   		   if(param.result=='logout'){
		   			   alert('로그인 후 사용하세요');
		   		   }else if(param.result=='success'){
		   			   $('#randomNumber').text(param.randomNumber);
		   		   }else{
		   			   alert('난수 발생 오류');
		   		   }
		   	   },
		   	   error:function(){
		   		   alert('네트워크 오류');
		   	   }
		   });
	   }
	   //초기 데이터 호출
	   get_randomNumber();
   });
</script>
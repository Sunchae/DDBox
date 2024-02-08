<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Summary 시작 -->
<div style="background-color: lightgray; padding: 20px; width: 45%;">
    <div style="display: flex; align-items: center;">
        <img src="${pageContext.request.contextPath}/member/photoView" alt="프로필 사진" style="width: 80px; height: 80px; border-radius: 50%; margin-right: 10px;">
        <div>
            <h4>${user.mem_name}</h4>
            <p>${user.mem_nickname} <button>닉네임 변경</button></p>
        </div>
    </div>
    <hr>
    <div>
        <h4>회원 등급: ${user.mem_grade}</h4>
    </div>
    <div style="display: flex; justify-content: space-between; margin-top: 20px;">
        <div>
            <h4>보유 쿠폰 정보</h4>
            
        </div>
        <div>
            <h4>포인트 정보</h4>
            <p> 포인트</p>
        </div>
    </div>
</div>
<!-- Summary 끝 -->
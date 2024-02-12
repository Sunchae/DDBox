<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 내용 시작 -->
<div class="page-main">
    <h2 class="login-title">회원로그인</h2>
    <form:form id="member_login" action="login" modelAttribute="memberVO" class="login-form">
        <form:errors element="div" cssClass="error-messages"/>
        <div class="input-container">
            <form:input path="mem_id" placeholder=" " cssClass="form-input" autocomplete="off"/>
            <form:label path="mem_id" cssClass="form-label">아이디</form:label>
            <form:errors path="mem_id" element="div" cssClass="error-color"/>
        </div>
        <div class="input-container">
            <form:password path="mem_pw" placeholder=" " cssClass="form-input"/>
            <form:label path="mem_pw" cssClass="form-label">비밀번호</form:label>
            <form:errors path="mem_pw" element="div" cssClass="error-color"/>
        </div>
        <div class="stay-logged-in">
            <input type="checkbox" id="auto" name="auto">
            <label for="auto">로그인상태유지</label>
        </div>
        <div class="form-actions">
            <form:button class="login-btn">로그인</form:button>
        </div>
    </form:form>
    <div class="align-center">
        <button class="home-btn" onclick="location.href='${pageContext.request.contextPath}/main/main'">홈으로</button>
    </div>
</div>

<!-- 내용 끝 -->
<style>
body, html {
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5; /* 배경색 변경 */
}

.page-main {
    max-width: 400px;
    margin: 40px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 6px rgba(0,0,0,0.1); /* 그림자 효과 */
}

.login-title {
    text-align: center;
    color: #333;
}

.login-form {
    margin-top: 20px;
}

.input-container {
    position: relative;
    margin-bottom: 20px;
}

.form-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    transition: border-color .3s;
}

.form-input:focus {
    border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
}

.form-label {
    position: absolute;
    top: 10px;
    left: 10px;
    background-color: #fff;
    padding: 0 5px;
    transition: transform 0.3s, font-size 0.3s;
    transform-origin: left top;
}

.form-input:focus + .form-label,
.form-input:not(:placeholder-shown) + .form-label {
    transform: translateY(-20px) scale(0.75);
    font-size: 0.75em;
}

.error-color {
    color: #d9534f; /* 오류 메시지 색상 */
}

.stay-logged-in {
    margin: 10px 0;
}

.form-actions {
    text-align: center;
}

.login-btn, .home-btn {
    background-color: #4B3891;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color .3s;
}

.login-btn:hover, .home-btn:hover {
    background-color: #0056b3;
}

.align-center {
    text-align: center;
    margin-top: 20px;
}

.home-btn {
    background-color: #6c757d; /* 홈 버튼 색상 */
}

.home-btn:hover {
    background-color: #565e64;
}

</style>










<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>회원가입여부 확인</h2>
	<form:form action="registerUserCheck" id="member_registerCheck" modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="mem_name">이름</form:label>
				<form:input path="mem_name"  placeholder="이름을 입력해주세요"/>
				<form:errors path="mem_name" cssClass="error-color"/>
			</li>
						
			<li>
				<form:label path="mem_birth">생년월일</form:label> 
				<form:input	path="mem_birth" placeholder="생년월일을 입력해주세요" /> 
				<form:errors path="mem_birth" cssClass="error-color" />
			</li>
			<li>
				<form:label path="mem_phone">휴대폰 번호</form:label> 
				<form:input	path="mem_phone" placeholder="휴대폰 번호를 입력해주세요" /> 
				<form:errors path="mem_phone" cssClass="error-color" />
			</li>
            
			
		</ul> 
		<div class="align-center">
			<form:button class="default-btn">가입여부 확인</form:button>
			<input type="button" value="홈으로" class="default-btn"
			    onclick="location.href='${pageContext.request.contextPath}/main/main'">
		</div>                                  
	</form:form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>


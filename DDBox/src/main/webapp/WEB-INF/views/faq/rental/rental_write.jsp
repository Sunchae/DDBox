<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>단체/대관 문의</h2>
	<form:form action="write" modelAttribute="rentalVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				영화관 선택
			</li>
		</ul>
		
		<!-- 내용기입 -->	
		<ul>
	 		<li>
				<form:label path="rental_content">내용</form:label>
				<form:textarea path="rental_content"/>
				<form:errors path="rental_content" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="rental_per">희망인원</form:label>
				<form:textarea path="rental_per"/>
				<form:errors path="rental_per" cssClass="error-color"/>
			</li>
	 		<li>
				<form:label path="rental_name">문의자명</form:label>
				<form:textarea path="rental_name"/>
				<form:errors path="rental_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="rental_phone">연락처</form:label>
				<form:textarea path="rental_phone"/>
				<form:errors path="rental_phone" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="rental_email">이메일</form:label>
				<form:textarea path="rental_email"/>
				<form:errors path="rental_email" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>등록하기</form:button>
			<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/rental'">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->

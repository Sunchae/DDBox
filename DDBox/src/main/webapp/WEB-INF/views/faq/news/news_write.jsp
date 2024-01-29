<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>공지 작성</h2>
	<form:form action="write" modelAttribute="newsVO" id="register_form">
	<form:errors element="div" cssClass="error-color"/>
	<ul>
		<li>
			<form:label path="news_title">제목</form:label>
			<form:input path="news_title"/>
			<form:errors path="news_title" cssClass="error-color"/>
		</li>
 		<li>
			<form:label path="news_category">유형</form:label>
			<form:radiobutton path="news_category" value="1"/>시스템점검
			<form:radiobutton path="news_category" value="2"/>극장
			<form:radiobutton path="news_category" value="3"/>행사/이벤트
			<form:radiobutton path="news_category" value="4"/>기타
			<form:errors path="news_category" cssClass="error-color"/>
		</li>
		<li>
			<form:label path="news_content">내용</form:label>
			<form:textarea path="news_content"/>
			<form:errors path="news_content" cssClass="error-color"/>
		</li>
	</ul>
	<div>
		<form:button>작성</form:button>
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/news'">
	</div>
	</form:form>
</div>
<!-- 내용 끝 -->

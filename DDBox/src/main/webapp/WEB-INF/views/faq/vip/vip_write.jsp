<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>공지 작성</h2>
	<form:form action="write" modelAttribute="vipVO" id="register_form">
	<form:errors element="div" cssClass="error-color"/>
	<ul>
		<li>
			<form:label path="vip_title">제목</form:label>
			<form:input path="vip_title"/>
			<form:errors path="vip_title" cssClass="error-color"/>
		</li>
		<li>
			<form:label path="vip_content">내용</form:label>
			<form:textarea path="vip_content"/>
			<form:errors path="vip_content" cssClass="error-color"/>
		</li>
	</ul>
	<div>
		<form:button>작성</form:button>
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/vip'">
	</div>
	</form:form>
</div>
<!-- 내용 끝 -->
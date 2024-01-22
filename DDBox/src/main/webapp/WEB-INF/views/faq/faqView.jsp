<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h1>고객센터 페이지</h1>
	<div class="align-right">
		<c:if test="${!empty user}">
		<input type="button" value="글쓰기" onclick="location.href='write'">
		</c:if>
	</div>
</div>
<!-- 내용 끝 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<div class="main-title">
		<h2>스토어</h2>
		<div class="align-right">
			<c:if test="${user.mem_auth ==9}"> 		<%-- 관리자 로그인 되어있을 때 만 보임 --%>
			<input type="button" value="글쓰기" onclick="location.href='write'">
			</c:if>
		</div>
	</div>
</div>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<c:forEach var="store" items="${list}">
	<c:if test="${store.store_type == 0}">
	<div class="store-main-list">
		<ul>
			<li>
				<a href="detail?store_num=${store.store_num}"><img src="${pageContext.request.contextPath}/upload/${store.store_photo}">
				<span>${store.store_title}</span>
				<span>${store.store_name}</span>
				</a>
			</li>
		</ul>
	</div>
	</c:if>
	</c:forEach>
	</c:if>
<!-- 내용 끝 -->

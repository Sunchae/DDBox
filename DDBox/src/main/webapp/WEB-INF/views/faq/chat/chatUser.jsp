<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 로그인해야 들어올수있는곳?? -->
<!-- 내용 시작 -->
<div>
	<h6>지난 문의 내역</h6>
	<!-- 검색 시작 -->
	<!-- 검색 끝 -->
	
	<div class="align-right">
		<input type="button" value="1:1문의하기" onclick="location.href='chatRoomWrite'">
	</div>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 채팅방이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<li>채팅방 생성 완료</li>
	</c:if>
</div>
<!-- 내용 끝 -->
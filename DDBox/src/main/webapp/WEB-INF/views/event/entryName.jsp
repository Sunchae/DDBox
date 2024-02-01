<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<div class="tit-util">
	<h3>당첨자 리스트</h3>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	
	<table class="striped-table">
		<tr>
			<th>응모자 번호</th>
			<th>응모자 아이디</th>
			<th>응모자 참여 날짜</th>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			<td class="align-center">${list.entry_num}</td>
			<td class="align-center">${list.mem_id}</td>
			<td class="align-center">${list.entry_date}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
</div>
<!-- 내용 끝 -->
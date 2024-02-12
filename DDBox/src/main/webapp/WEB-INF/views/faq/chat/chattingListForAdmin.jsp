<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SSH.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- 내용 시작 -->
<div class="page-main">
	<h5>상담톡 문의확인</h5>
	<span>등록된 상담톡 문의입니다</span>

	<div>
	<c:if test="${count == 0}">
		<div class="result-display">표시할 채팅방이 없습니다.</div>
	</c:if>
		
	<c:if test="${count>0}">
	<br><br><br>
		<table class="striped-table">
			<tr>
				<th class="align-center" width="150">번호</th>
				<th class="align-center">상담톡</th>
			</tr>
			<!-- 항목이 없고 한번에 나열할거라 그냥 반복 -->
			<c:forEach var="chat" items="${list}">
			<tr>
				<td class="align-center" width="150"><a href="chatUserRoom_detail?chatroom_num=${chat.chatroom_num}">${chat.chatroom_num}</a></td>
				<td class="align-center"><a href="chatUserRoom_detail?chatroom_num=${chat.chatroom_num}">${chat.mem_id} 님의 문의입니다</a></td>
				<%-- 
				<td>
					<c:if test="${!empty chat.reg_date}">${chat.reg_date}</c:if>
					<c:if test="${empty chat.reg_date}"></c:if>
				</td>
				--%>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
</div>
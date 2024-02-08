<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div>
	<div>
	<c:if test="${count == 0}">
		<div class="result-display">표시할 채팅방이 없습니다.</div>
	</c:if>
		
	<c:if test="${count>0}">
		<table class="striped-table">
			<!-- 항목이 없고 한번에 나열할거라 그냥 반복 -->
			<c:forEach var="chat" items="${list}">
			<tr>
				<td style="text-align:left;">
					<a href="chatUserRoom_detail?chatroom_num=${chat.chatroom_num}">
						<b>${chat.mem_id}</b>
						<br>
					</a>
				</td>
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
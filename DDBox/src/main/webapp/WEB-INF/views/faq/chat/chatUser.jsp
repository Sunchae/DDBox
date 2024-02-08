<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- 내용 시작 -->
<div>
	<div class="align-align">
	<c:if test="${user.mem_auth!=9}">
		<h6>문의하러가기</h6>
		<input type="button" value="1:1문의하기" onclick="location.href='${pageContext.request.contextPath}/faq/chat/chattingListForUser'">
	</c:if>
	</div>
	
	<div>
	<c:if test="${user.mem_auth==9}">
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
							<b>${ChatroomVO.user_num}</b>
							<br>
						</a>
					</td>
					<td>
						<c:if test="${!empty chat.ChatVO.reg_date}">${chat.ChatVO.reg_date}</c:if>
						<c:if test="${empty chat.ChatVO.reg_date}"></c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
	</c:if>
	</div>
</div>
<!-- 내용 끝 -->
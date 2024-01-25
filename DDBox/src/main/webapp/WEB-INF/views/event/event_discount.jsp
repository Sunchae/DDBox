<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="page-main">
	<form action="main" id="event_form" method="get">
		<div class="tit-util">
			<h3 class="tit">제휴/할인</h3>
		</div>
		<c:forEach var="list" items="${list}">
		<c:if test="${list.event_type == 5}">
		<div class="event-list">
			<ul>
				<li class="list-card">
					<a href="detail?event_num=${list.event_num}">
						<p class="img">
							<img src="${pageContext.request.contextPath}/upload/${list.event_photo1}" class="list-img">
						</p>
						<p class="tit">${list.event_title}</p>
						<p class="date">${list.event_start}~${list.event_end}</p>
					</a>
				</li>
			</ul>
		</div>
	</c:if>
	</c:forEach>
	</form>
</div>
<!-- 내용 끝 -->
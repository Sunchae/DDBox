<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div id="event-list-wrap">
	<div class="inner-wrap">
		<div class="tit-util">
			<h3 class="tit">SPECIAL</h3>
			<div class="more-btn">
				<input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/event/write'">
				<a href="${pageContext.request.contextPath}/event/special">더보기</a>
			</div>
		</div>
		<div class="event-list">
			<ul>
				<li>
					<a>
						<p class="img"><img></p>
						<p class="tit">이벤트 1</p>
						<p class="date">날짜</p>
					</a>
				</li>
				<li>
					<a>
						<p class="img"><img></p>
						<p class="tit">이벤트 1</p>
						<p class="date">날짜</p>
					</a>
				</li>
				<li>
					<a>
						<p class="img"><img></p>
						<p class="tit">이벤트 1</p>
						<p class="date">날짜</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- 내용 끝 -->
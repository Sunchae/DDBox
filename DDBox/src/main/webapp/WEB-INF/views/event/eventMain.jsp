<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<div id="page-main">
		<form action="main" id="event_form" method="get">
			<div class="tit-util">
				<h3 class="tit">SPECIAL</h3>
				<div class="more-btn">
					<input type="button" value="글쓰기" onclick="location.href='write'"> 
						<a href="${pageContext.request.contextPath}/event/special">더보기</a>
				</div>
			</div>
		</form>
		<div class="event-list">
			<ul>
				<li><a>
						<p class="img">
							<img>
						</p>
						<p class="tit">이벤트 1</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a>
						<p class="img">
							<img>
						</p>
						<p class="tit">이벤트 1</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a>
						<p class="img">
							<img>
						</p>
						<p class="tit">이벤트 1</p>
						<p class="date">날짜</p>
				</a></li>
			</ul>
		</div>
	

</div>
<!-- 내용 끝 -->
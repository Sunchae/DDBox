<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YSC.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<div id="header">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-top p-0" id="navbar-top">
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a href="#" class="nav-link">VIP LOUNGE</a></li>
					<li class="nav-item"><a href="#" class="nav-link">멤버십</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/faq/main" class="nav-link">고객센터</a></li>
				</ul>
				<ul class="navbar-nav">
					<c:if test="${empty user }">
						<li class="nav-item"><a href="${pageContext.request.contextPath}/member/login" class="nav-link">로그인</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/member/registerUser" class="nav-link">회원가입</a></li>
					</c:if>
					<c:if test="${!empty user }">
						<li class="nav-item"><a href="${pageContext.request.contextPath}/member/logout" class="nav-link">로그아웃</a></li>
					</c:if>
					<li class="nav-item"><a href="#" class="nav-link">빠른예매</a></li>
				</ul>
			</div>
		</nav>
	
		<nav class="navbar navbar-expand-lg navbar-light" id="navbar-2">
			<div class="collapse navbar-collapse justify-content-start">
				<ul class="navbar-nav util-list">
					<li class="nav-item">
					<a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/images/nav/ico-sitemap.png"></a>
					</li>
	
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <img
							src="${pageContext.request.contextPath}/images/nav/ico-search.png">
					</a>
					<%-- 	<ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="">
							<div class="search-box p-3">
								<form action="">
		     		 				<input class="form-control" type="search" name="keyword" value="" placeholder="영화를 검색하세요!" aria-label="Search">
		      						<button class="btn btn-sm" type="button"><img src="${pageContext.request.contextPath}/images/nav/ico-search.png"></button>
		    					</form>
							</div>
						</ul> --%>
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/movie/main">영화</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/reserve/reserveMain">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="#">극장</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/main/main" ><img id="DDBoxLogo" src="${pageContext.request.contextPath}/images/DDBox.png"></a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/event/main">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/store/main">스토어</a></li>
					<li class="nav-item"><a class="nav-link" href="#">혜택</a></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse justify-content-end">
				<ul class="navbar-nav util-list">
					<li class="nav-item"><a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/images/nav/ico-schedule.png"></a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/myPage"><img src="${pageContext.request.contextPath}/images/nav/ico-mymega.png"></a></li>
				</ul>
			</div>
		</nav>
	</div>
</div>
<!-- 로그인 모달 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 내용 시작 -->
<div class="page-main">
	<div class="main-title" id="store_form">
		<div class="align-right">
			<c:if test="${user.mem_auth ==9}">
				<%-- 관리자 로그인 되어있을 때 만 보임 --%>
				<input type="button" value="글쓰기" onclick="location.href='write'">
			</c:if>
		</div>
	</div>
</div>
<!-- 내용 끝 -->
<script src="//cast.imp.joins.com/head/sNpWayIeZMwBzZiXjLEN5CFsn6DhQ2SnK1WFI5QSow2EAM4qWzAZAbZLTXgybHJFT1FUaXl1R2dEcHVJcVFBAstB2XI2taBmKgPLQdlyNrWgZio.js?url=https%3A%2F%2Fmegabox.co.kr%2Fstore%3FprdtClCd%3D&ref=https%3A%2F%2Fmegabox.co.kr%2Fstore%3FprdtClCd%3DCPC07"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KJY.css">
<!-- storeMainList -->
<div id="storeMainList">
<!-- contents -->
	<div id="contents">
<!-- inner-wrap -->
		<div class="inner-wrap">
			::before
			<h2 class="tit">스토어</h2>
<!-- tab-list -->
			<div class="tab-list fixed">
				::before
				<ul>
					<li id="storeTab_ticketList"><a href="${pageContext.request.contextPath}/store/ticketList">디디티켓</a>
					</li>
					<li id="storeTab_popcorn"><a href="${pageContext.request.contextPath}/store/popcorn">팝콘/음료/굿즈</a>
					</li>
					::after
				</ul>
				::after
			</div>
			<div id="divNewPrdArea">
				<div class="tit-util mt80 mb15">
				::before
				<h3 class="tit">디디티켓</h3>
				<div class="right">
					<a href="${pageContext.request.contextPath}/store/ticketList">더보기</a>
				</div>
				</div>
				<div class="store-list">
					<ul class="list">
						<li><a href=""></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

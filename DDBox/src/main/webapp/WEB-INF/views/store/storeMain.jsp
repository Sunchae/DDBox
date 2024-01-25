<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>스토어</h2>
	<div class="align-right">
			<c:if test="${user.mem_auth ==9}"> 		<%-- 관리자 로그인 되어있을 때 만 보임 --%>
			<input type="button" value="글쓰기" onclick="location.href='write'">
			</c:if>
	</div>
	<div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/store/storeTicketList">디디티켓</a></li>
			<li><a>팝콘/음료/굿즈</a></li>
		</ul>
	</div>
	<div class="store-main">
		<ul>
			<li>
				<a href="detail?store_num=${store_num}"><img src="${pageContext.request.contextPath}/upload/${list.store_photo}">
					<span>${list.store_title}</span>
					<span>${list.store_name}</span>
				</a>
			</li>
		</ul>
	</div>
</div>
<!-- 내용 끝 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>디디티켓</h2>
		<div class="align-right">
			<c:if test="${user.mem_auth ==9}"> 		<%-- 관리자 로그인 되어있을 때 만 보임 --%>
			<input type="button" value="글쓰기" onclick="location.href='write'">
			</c:if>
		</div>
	<table>
		<tr>
			<th>번호</th>
			<th width="400">제목</th>
			<th>작성일</th>
		</tr>
	</table>
</div>
<!-- 내용 끝 -->
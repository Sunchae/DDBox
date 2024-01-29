<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h6>VIP FAQ</h6>
	<span>고객님께서 궁금하신 내용을 먼저 확인해주세요.</span>
	
	<div class="align-right">
		<c:if test="${user.mem_auth==9}">
			<input type="button" value="글쓰기" onclick="location.href='vip/write'">
		</c:if>
	</div>
	<c:if test="${count==0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<table class="striped-table">
		<tr>
			<th class="align-center">번호</th>
			<th width="400" class="align-center">제목</th>
		</tr>
		<c:forEach var="vip" items="${list}"> <!-- 여기 다시 한번 확인 -->
		<tr>
			<td class="align-center"><a href="vip/detail?vip_num=${vip.vip_num}">${vip.vip_num}</a></td>
			<td class="align-center"><a href="vip/detail?vip_num=${vip.vip_num}">${vip.vip_title}</a></td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</div>
<!-- 내용 끝 -->
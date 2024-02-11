<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
<h2>마이페이지 기프트샵</h2>
</div>
<div class="result-display">
	<table class="striped-table">
		<tr>
			<th>주문번호</th>
			<th width="300">상품명</th>
			<th>총 구매금액</th>
			<th>주문날짜</th>
		</tr>
		<c:forEach var="storePay" items="${list}">
		<tr>
			<td>${storePay.pay_id}</td>
			<td><a href="">${storePay.store_title}</a></td>
			<td>${storePay.total_price}</td>
			<td>${storePay.pay_date}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
</div>
<!-- 내용 끝 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>대관 문의</h2>

	<!-- 검색 기능 -->
	<form action="rental" id="search_form" method="get">
		<ul class="search">
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}" placeholder="검색어를 입력하세요">
			</li>
			<li>
				<input type="submit" value="검색">
				<input type="button" value="목록" onclick="location.href='rental'">
			</li>
		</ul>
		<div class="align-right">
			<c:if test="${!empty user}">
				<input type="button" value="글쓰기" onclick="location.href='rental/write'">
			</c:if>
		</div>
	</form>
	
	<c:if test="${count==0}">
	<div class="result-display">신청한 예약건이 없습니다</div>
	</c:if>
	<c:if test="${count>0}">
	<table class="striped-table">
		<tr>
			<th class="align-center">번호</th>
			<th class="align-center">희망영화관</th>
			<th width="400" class="align-center">문의자명</th>
			<th class="align-center">관람희망일</th>
			<th class="align-center">등록일</th>
			<th class="align-center">상태</th>
		</tr>
		<c:forEach var="rental" items="${list}"> 
		<tr>
			<td class="align-center"><a href="rental/detail?rental_num=${rental.rental_num}">${rental.rental_num}</a></td>
			<td class="align-center"><a href="rental/detail?rental_num=${rental.rental_num}">${rental.res_num}</a></td>
			<td class="align-center"><a href="rental/detail?rental_num=${rental.rental_num}">${rental.rental_name}</a></td>
			<td class="align-center"><a href="rental/detail?rental_num=${rental.rental_num}">${rental.rental_date}</a></td>
			<td class="align-center"><a href="rental/detail?rental_num=${rental.rental_num}">${rental.rental_regdate}</a></td>
			<td class="align-center">
				<c:if test="${rental.rental_status==1}">접수중</c:if>
				<c:if test="${rental.rental_status==2}">접수완료</c:if>
				<c:if test="${rental.rental_status==3}">승인완료</c:if>
				<c:if test="${rental.rental_status==9}">접수취소</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요');
			$('#keyword').val('').focus();
			return false;
		}
	});//end of submit
	
	//정렬 선택
	$('#order').change(function(){
		location.href='rental?keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
});
</script>
<!-- 내용 끝 -->
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>자주묻는 질문</h2>
	
	<!-- 검색 기능 -->
	<form action="question" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>제목+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
				<input type="button" value="목록" onclick="location.href='question'">
			</li>
		</ul>
		<div class="align-right">
			<select id="order" name="order">
				<option value="1" <c:if test="${param.order == 1}">selected</c:if>>목록순</option>
				<option value="2" <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
				<option value="3" <c:if test="${param.order == 3}">selected</c:if>>최신순</option>
			</select>
			<c:if test="${user.mem_auth==9}">
				<input type="button" value="글쓰기" onclick="location.href='question/write'">
			</c:if>
		</div>
	</form>
	<c:if test="${count==0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<table class="striped-table">
		<tr>
			<th class="align-center">번호</th>
			<th class="align-center">구분</th>
			<th width="400" class="align-center">제목</th>
			<th class="align-center">조회수</th>
		</tr>
		<c:forEach var="question" items="${list}"> <!-- 여기 다시 한번 확인 -->
		<tr>
			<td class="align-center"><a href="question/detail?board_num=${question.board_num}">${question.board_num}</a></td>
			<td class="align-center">
				<c:if test="${question.board_category==1}">예매</c:if>
				<c:if test="${question.board_category==2}">관람/결제수단</c:if>
				<c:if test="${question.board_category==3}">멤버십</c:if>
				<c:if test="${question.board_category==4}">VIP</c:if>
				<c:if test="${question.board_category==5}">할인/혜택</c:if>
				<c:if test="${question.board_category==6}">영화관</c:if>
				<c:if test="${question.board_category==7}">특별관</c:if>
				<c:if test="${question.board_category==8}">기프트샵</c:if>
				<c:if test="${question.board_category==9}">홈페이지/모바일</c:if>
			</td>
			<td class="align-center"><a href="question/detail?board_num=${question.board_num}">${question.board_title}</a></td>
			<td class="align-center"><a href="question/detail?board_num=${question.board_num}">${question.board_hit}</a></td>
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
		location.href='question?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
});
</script>
<!-- 내용 끝 -->
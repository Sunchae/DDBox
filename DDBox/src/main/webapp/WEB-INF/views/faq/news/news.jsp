<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>공지/뉴스</h2>
	
	<!-- 검색 기능 -->
	<form action="news" id="search_form" method="get">
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
				<input type="button" value="목록" onclick="location.href='news'">
			</li>
		</ul>
		<div class="align-right">
			<select id="order" name="order">
				<option value="1" <c:if test="${param.order == 1}">selected</c:if>>목록순</option>
				<option value="2" <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
				<option value="3" <c:if test="${param.order == 3}">selected</c:if>>최신순</option>
			</select>
			<c:if test="${user.mem_auth==9}">
				<input type="button" value="글쓰기" onclick="location.href='news/write'">
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
		<c:forEach var="news" items="${list}"> <!-- 여기 다시 한번 확인 -->
		<tr>
			<td class="align-center"><a href="news/detail?news_num=${news.news_num}">${news.news_num}</a></td>
			<td class="align-center">
				<c:if test="${news.news_category==1}">예매</c:if>
				<c:if test="${news.news_category==2}">극장</c:if>
				<c:if test="${news.news_category==3}">행사/이벤트</c:if>
				<c:if test="${news.news_category==4}">제휴이벤트</c:if>
				<c:if test="${news.news_category==5}">기타</c:if>
			</td>
			<td class="align-center"><a href="news/detail?news_num=${news.news_num}">${news.news_title}</a></td>
			<td class="align-center"><a href="news/detail?news_num=${news.news_num}">${news.news_hit}</a></td>
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
		location.href='news?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
});
</script>
<!-- 내용 끝 -->
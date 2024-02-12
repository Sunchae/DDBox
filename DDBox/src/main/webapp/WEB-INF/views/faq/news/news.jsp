<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SSH.css">
<!-- 내용 시작 -->
<div class="page-main">
	<h6>공지/뉴스</h6>
	<span>DDBOX의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</span>
	
	<!-- 검색 기능 -->
	<form action="news" id="search_form" method="get">
		<ul class="search">
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}" placeholder="검색어를 입력하세요">
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
	
	<!-- 카테고리 -->
	<div class="search_area">
		<ul class="c_tab type_free">
			<li class="on"><a href="news">전체</a></li>
			<li class="on"><a href="news?news_category=1">시스템점검</a></li>
			<li class="on"><a href="news?news_category=2">극장</a></li>
			<li class="on"><a href="news?news_category=3">행사/이벤트</a></li>
			<li class="on"><a href="news?news_category=4">기타</a></li>
		</ul>
	</div>
	
	<br><hr style="border-width:1px 0 0 0; border-color:#ccc;">
	<div>
	<span>총 ${count}건이 검색되었습니다.</span>
	</div>
	<hr style="border-width:1px 0 0 0; border-color:#ccc;">
	
	<!-- 컬럼 -->
	<table>
		<tr>
			<th class="align-center">번호</th>
			<th class="align-center">구분</th>
			<th width="400" class="align-center">제목</th>
			<th class="align-center">조회수</th>
		</tr>
	</table>
		<hr style="border-width:1px 0 0 0; border-color:#ccc;">
		
		<!-- 데이터 -->
		<table>
		<c:forEach var="news" items="${list}"> <!-- 여기 다시 한번 확인 -->
		<tr>
			<td class="align-center"><a href="news/detail?news_num=${news.news_num}">${news.news_num}</a></td>
			<td class="align-center">
				<c:if test="${news.news_category==1}">[시스템점검]</c:if>
				<c:if test="${news.news_category==2}">[극장]</c:if>
				<c:if test="${news.news_category==3}">[행사/이벤트]</c:if>
				<c:if test="${news.news_category==4}">[기타]</c:if>
			</td>
			<td class="align-center"><a href="news/detail?news_num=${news.news_num}">${news.news_title}</a></td>
			<td class="align-center"><a href="news/detail?news_num=${news.news_num}">${news.news_hit}</a></td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
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
		location.href='question?keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
});
</script>
<!-- 내용 끝 -->
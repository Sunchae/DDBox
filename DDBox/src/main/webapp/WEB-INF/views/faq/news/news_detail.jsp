<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<div class="page-main">
		<h2>${news.news_title}</h2>
		<ul class="detail-info">
			<li>
				작성일 : ${news.news_regdate}
				조회 : ${news.news_hit}
			</li>
		</ul>
		<hr size="1" width="100%">
		<div class="detail-content">
			${news.news_content}
		</div>
		<hr size="1" width="100%">
		<div class="align-right">
			<c:if test="${!empty user && user.mem_auth == 9}">
				<input type="button" value="수정" onclick="location.href='update?news_num=${news.news_num}'">
				<input type="button" value="삭제" id="delete_btn">
				<script type="text/javascript">
					let delete_btn = document.getElementById('delete_btn');
					delete_btn.onclick=function(){
						let choice = confirm('삭제하시겠습니까?');
					if(choice){
						location.href='delete?news_num=${news.news_num}'
					}
				};
			</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/faq/news'">
		</div>
		<hr size="1" width="100%">
	</div>
<!-- 내용 끝 -->
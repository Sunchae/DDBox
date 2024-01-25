<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<div class="page-main">
		<h2>${vip.vip_title}</h2>
		<hr size="1" width="100%">
		<div class="detail-content">
			${vip.vip_content}
		</div>
		<hr size="1" width="100%">
		<div class="align-right">
			<c:if test="${!empty user && user.mem_auth == 9}">
				<input type="button" value="수정" onclick="location.href='update?vip_num=${vip.vip_num}'">
				<input type="button" value="삭제" id="delete_btn">
				<script type="text/javascript">
					let delete_btn = document.getElementById('delete_btn');
					delete_btn.onclick=function(){
						let choice = confirm('삭제하시겠습니까?');
					if(choice){
						location.href='delete?vip_num=${vip.vip_num}'
					}
				};
			</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/faq/vip'">
		</div>
		<hr size="1" width="100%">
	</div>
<!-- 내용 끝 -->
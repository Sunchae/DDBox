<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<div class="page-main">
	<h2>${board.title}</h2>
	<c:if test="${!empty store.sotre_photo}">
	<ul>
		<li>첨부파일 : <a href="file?store_num=${store.store_num}">${store.store_photo}</a></li>
	</ul>
	</c:if>
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(store.store_photo, '.jpg') ||
				fn:endsWith(store.store_photo, '.JPG') ||
				fn:endsWith(store.store_photo, '.jpeg') ||
				fn:endsWith(store.store_photo, '.JPEG') ||
				fn:endsWith(store.store_photo, '.gif') ||
				fn:endsWith(store.store_photo, '.GIF') ||
				fn:endsWith(store.store_photo, '.png') ||
				fn:endsWith(store.store_photo, '.PNG')}">
	<div class="align-center">
		<img src="${pageContext.request.contextPath}/upload/${store.store_photo}" class="detail-img">
	</div>
	</c:if>
	<div class="detail-content">
		${store.store_content}
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${user.mem_auth == 9}">
		<input type="button" value="수정" onclick="location.href='update?store_num=${store.store_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.href='delete?store_num=${store.store_num}';
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='storeMain'">
	</div>
	<hr size="1" width="100%">
	</div>
<!-- 내용 끝 -->

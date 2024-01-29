<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>${email.qna_title}</h2>
	<ul class="detail-info">
		<li>
			작성일 : ${email.question_regdate}
		</li>
	</ul>
	<hr size="1" width="100%">
	<ul> <!-- 파일 다운로드 -->
		<li>첨부파일 : <a href="file?qna_num=${email.qna_num}">${email.question_file}</a></li>
	</ul>
	<!-- 사진 -->
	<c:if test="${fn:endsWith(email.question_file, '.jpg') ||
				  fn:endsWith(email.question_file, '.JPG') ||
				  fn:endsWith(email.question_file, '.jpeg') ||
				  fn:endsWith(email.question_file, '.JPEG') ||
				  fn:endsWith(email.question_file, '.gif') ||
				  fn:endsWith(email.question_file, '.GIF') ||
				  fn:endsWith(email.question_file, '.png') ||
				  fn:endsWith(email.question_file, '.PNG')}">
	<div class="align-center">
		<img src="${pageContext.request.contextPath}/upload/${email.question_file}" class="detail-img">
	</div>
	</c:if>
	<!-- 질문글 -->
	<div class="detail-content">
		${email.question_content}
	</div>
	<hr size="1" width="100%">
	
	<!-- 답글 -->
	<c:if test="${email.ask_content!=null}">
	
	<div class="page-main">
	<h2>${member.mem_name}님, 답변 드립니다.</h2> <!-- 여기 다시 한번 확인하기 -->
	<ul class="detail-info">
		<li>
			답변 등록일 : ${email.ask_regdate}
		</li>
	</ul>
	<hr size="1" width="100%">
	<div class="detail-content">
		${email.ask_content}
	</div>
	</div>
	<hr size="1" width="100%">	
	</c:if>
	
	<div class="align-right">
		<c:if test="${!empty user && user.mem_auth == 9}">
			<input type="button" value="답글작성" onclick="location.href='update?qna_num=${email.qna_num}'">
		</c:if>
		<c:if test="${!empty user && user.mem_num == email.mem_num}">
			<input type="button" value="삭제" id="delete_btn">
			<script type="text/javascript">
				let delete_btn = document.getElementById('delete_btn');
				delete_btn.onclick=function(){
					let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.href='delete?qna_num=${email.qna_num}'
				}
			};
		</script>
	</c:if>
	<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/faq/email'">
	</div>
	<hr size="1" width="100%">
</div>
<!-- 내용 끝 -->

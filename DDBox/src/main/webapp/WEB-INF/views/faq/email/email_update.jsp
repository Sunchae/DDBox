<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>문의 답변하기</h2>
	<form:form action="update" modelAttribute="emailVO" id="update_form" enctype="multipart/form-data">
	<form:hidden path="qna_num"/>
	<form:errors element="div" cssClass="error-color" />
	<ul>
		<li>
			<form:label path="question_content">문의글</form:label>
		</li>
		<li>
			<c:if test="${fn:endsWith(emailVO.question_file, '.jpg') ||
						  fn:endsWith(emailVO.question_file, '.JPG') ||
						  fn:endsWith(emailVO.question_file, '.jpeg') ||
						  fn:endsWith(emailVO.question_file, '.JPEG') ||
						  fn:endsWith(emailVO.question_file, '.gif') ||
						  fn:endsWith(emailVO.question_file, '.GIF') ||
						  fn:endsWith(emailVO.question_file, '.png') ||
						  fn:endsWith(emailVO.question_file, '.PNG')}">
			<div class="align-center">
				<img src="${pageContext.request.contextPath}/upload/${emailVO.question_file}" class="detail-img">
			</div>
			</c:if>
			<textarea rows="5" cols="30" readonly="readonly">${emailVO.question_content}</textarea>
		</li>
		<li>
			<form:label path="ask_content">답변</form:label>
			<form:textarea path="ask_content"/>
			<form:errors path="ask_content" cssClass="error-color"/>
		</li>
	</ul>
	<div class="align-center">
        <form:button>작성</form:button>
        <input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/email/detail?qna_num=${emailVO.qna_num}'">
	</div>
	</form:form>
</div>

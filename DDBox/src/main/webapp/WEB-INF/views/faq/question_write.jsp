<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>글 쓰기</h2>
	<form:form action="write" modelAttribute="questionVO" id="register_form" enctype="multipart/form-data">
	<form:errors element="div" cssClass="error-color"/>
	<ul>
		<li>
			<form:label path="board_title">제목</form:label>
			<form:input path="board_title"/>
			<form:errors path="board_title" cssClass="error-color"/>
		</li>
		
<!-- 여기서 더 고쳐야 할 것
board_category 입력 버튼 생성
목록 > list 맞는지 확인
 -->
		<li>
			<form:label path="board_content">내용</form:label>
			<form:textarea path="board_content"/>
			<form:errors path="board_content" cssClass="error-color"/>
		</li>
	</ul>
	<div>
		<form:button>전송</form:button>
		<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/faq/question'">
	</div>
	</form:form>
</div>
<!-- 내용 끝 -->

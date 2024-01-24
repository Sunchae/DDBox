<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>글 수정</h2>
	<form:form action="update" modelAttribute="questionVO" id="update_form">
	<form:hidden path="board_num"/>
	<form:errors element="div" cssClass="error-color"/>
	<ul>
		<li>
			<form:label path="board_title">제목</form:label>
			<form:input path="board_title"/>
			<form:errors path="board_title" cssClass="error-color"/>
		</li>
 		<li>
			<form:label path="board_category">유형</form:label>
			<form:radiobutton path="board_category" value="1"/>예매
			<form:radiobutton path="board_category" value="2"/>관람/결제수단
			<form:radiobutton path="board_category" value="3"/>멤버십
			<form:radiobutton path="board_category" value="4"/>VIP
			<form:radiobutton path="board_category" value="5"/>할인/혜택
			<form:radiobutton path="board_category" value="6"/>영화관
			<form:radiobutton path="board_category" value="7"/>특별관
			<form:radiobutton path="board_category" value="8"/>기프트샵
			<form:radiobutton path="board_category" value="9"/>홈페이지/모바일
			<form:errors path="board_category" cssClass="error-color"/>
		</li>
		<li>
			<form:label path="board_content">내용</form:label>
			<form:textarea path="board_content"/>
			<form:errors path="board_content" cssClass="error-color"/>
		</li>
	</ul>
	<div class="align-center">
		<form:button>수정</form:button>
		<input type="button" value="취소" onclick="location.href='detail?board_num=${questionVO.board_num}'">
	</div>
	</form:form>
</div>
<!-- 내용 끝 -->

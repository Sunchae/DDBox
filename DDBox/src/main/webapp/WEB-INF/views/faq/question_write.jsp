<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>글 쓰기</h2>
	<form:form action="write" modelAttribute="questionVO" id="register_form">
	<form:errors element="div" cssClass="error-color"/>
	<ul>
		<li>
			<form:label path="board_title">제목</form:label>
			<form:input path="board_title"/>
			<form:errors path="board_title" cssClass="error-color"/>
		</li>
		
<!-- 여기서 더 고쳐야 할 것
board_category 입력 버튼 생성
 -->	
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
	<div>
		<form:button>작성</form:button>
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/question'">
	</div>
	</form:form>
</div>
<!-- 내용 끝 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SSH.css">
	<div class="page-main">
	<h5>자주묻는 질문</h5>
	<span>회원님들께서 가장 자주하시는 질문을 모았습니다.<br>궁금하신 내용에 대해 검색해보세요.</span>
	
	<br>
	
	<hr style="border-width:1px 0 0 0; border-color:#ccc;">
	<form:form action="update" modelAttribute="questionVO" id="update_form">
	<form:hidden path="board_num"/>
	<form:errors element="div" cssClass="error-color"/>
	<ul>
		<li>
			<form:label path="board_title">제목</form:label>
			<form:input path="board_title"/>
			<form:errors path="board_title" cssClass="error-color"/>
		</li><br>
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
		</li><br>
		<li><b>내용</b></li><br>
		<li>
			<form:textarea path="board_content"/>
			<form:errors path="board_content" cssClass="error-color"/>
			<script>
				function MyCustomUploadAdapterPlugin(editor){
					editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						return new UploadAdapter(loader);
					}
				}
				
				//데이터를 넣어야하기 때문에 #content를 찾음 (에러 발생시 console에 찍기)
				ClassicEditor
					.create(document.querySelector('#board_content'),{
						extraPlugins:[MyCustomUploadAdapterPlugin]
					})
					.then(editor => {
						window.editor = editor;
					})
					.catch(error => {
						console.error(error);
					});
			</script>
		</li>
	</ul>
	<div class="align-center">
		<form:button>수정</form:button>
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/question/detail?board_num=${questionVO.board_num}'">
	</div>
	</form:form>
</div>
<!-- 내용 끝 -->

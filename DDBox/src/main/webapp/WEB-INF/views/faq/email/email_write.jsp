<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>이메일 문의</h2>
	<form:form action="write" modelAttribute="emailVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
			※ 문의에 대한 따른 답변을 위해 회원 가입 시 입력하신 연락처를 확인해주세요. <input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/member/updateUser'">
			</li>
		</ul>
		
		<!-- 내용기입 -->	
		<ul>
	 		<li>
				<form:label path="qna_type">문의유형</form:label>
				<form:radiobutton path="qna_type" value="1"/>문의
				<form:radiobutton path="qna_type" value="2"/>불만
				<form:radiobutton path="qna_type" value="3"/>칭찬
				<form:radiobutton path="qna_type" value="4"/>제안
				<form:radiobutton path="qna_type" value="5"/>분실물
				<form:errors path="qna_type" cssClass="error-color"/>
			</li>
	 		<li>
				<form:label path="qna_scr">영화관 선택</form:label>
				<form:radiobutton path="qna_scr" value="0"/>선택하지않음
				<form:radiobutton path="qna_scr" value="1"/>선택함 <!-- 선택하면 영화관 정보 드롭박스 -->
				<form:errors path="qna_scr" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="scr_num">해당 영화관</form:label>
				<form:select path="scr_num">
		            <form:option value="scr_num">영화관 선택</form:option>
		            <c:forEach var="screen" items="${list}">
      				  <form:option value="${screen.scr_num}">${screen.scr_name}</form:option>
    				</c:forEach>
       			</form:select>
			</li>
			<li>
				<form:label path="qna_title">제목</form:label>
				<form:input path="qna_title"/>
				<form:errors path="qna_title" cssClass="error-color"/>
			</li>
			<li><b>내용</b></li>
			<li>
			<form:textarea path="question_content"/>
			<form:errors path="question_content" cssClass="error-color"/>
			<script>
				function MyCustomUploadAdapterPlugin(editor){
					editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						return new UploadAdapter(loader);
					}
				}
				
				//데이터를 넣어야하기 때문에 #content를 찾음 (에러 발생시 console에 찍기)
				ClassicEditor
					.create(document.querySelector('#question_content'),{
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
			<li>
				<form:label path="upload">첨부파일</form:label>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/email'">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SSH.css">
<div class="page-main">
	<h5>문의글 답변</h5>
	<span>회원 문의글에 답변을 남겨주세요.</span><br>
	
	<br>
	
	<hr style="border-width:1px 0 0 0; border-color:#ccc;">	
	
	<form:form action="update" modelAttribute="emailVO" id="update_form" enctype="multipart/form-data">
	<form:hidden path="qna_num"/>
	<form:hidden path="mem_num"/>
	<form:errors element="div" cssClass="error-color" />
	<ul>
		<li>
			<form:label path="question_content"><b>문의글</b></form:label><br>
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
		</li><br>
		<li><b>답변 내용</b></li><br>
			<li>
			<form:textarea path="ask_content"/>
			<form:errors path="ask_content" cssClass="error-color"/>
			<script>
				function MyCustomUploadAdapterPlugin(editor){
					editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						return new UploadAdapter(loader);
					}
				}
				
				//데이터를 넣어야하기 때문에 #content를 찾음 (에러 발생시 console에 찍기)
				ClassicEditor
					.create(document.querySelector('#ask_content'),{
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
        <form:button>등록</form:button>
        <input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/email/detail?qna_num=${emailVO.qna_num}'">
	</div>
	</form:form>
</div>

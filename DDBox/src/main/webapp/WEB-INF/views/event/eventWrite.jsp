<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>글쓰기</h2>
	<form:form action="write" modelAttribute="Event_listVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="event_title">제목</form:label>
				<form:input path="event_title"/>
				<form:errors path="event_title" cssClass="error-color"/>
			</li>
			<li><b>내용</b></li>
			<li>
				<form:textarea path="event_content"/>
				<form:errors path="event_content" cssClass="error-color"/>
				<script>
				function MyCustomUploadAdaperPlugin(editor){
					editor.plugins.get('FileRepository').createUploadAdapter = (loader) =>{
						return new UploadAdapter(loader);
					}
				}
				
				ClassicEditor
					.create(document.querySelector('#event_content'),{
						extraPlugins:[MyCustomUploadAdaperPlugin]
					})
					.then(editor => {
						window.editor = editor;
					})
					.catch(error => {
						console.error(error);
					});
				</script><!-- CKeditor 사용 -->
			</li>
			<li>
				<form:label path="upload">파일업로드</form:label>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='event/main'">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->
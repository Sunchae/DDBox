<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>공지 수정</h2>
	<form:form action="update" modelAttribute="newsVO" id="update_form">
	<form:hidden path="news_num"/>
	<form:errors element="div" cssClass="error-color"/>
	<ul>
		<li>
			<form:label path="news_title">제목</form:label>
			<form:input path="news_title"/>
			<form:errors path="news_title" cssClass="error-color"/>
		</li>
 		<li>
			<form:label path="news_category">유형</form:label>
			<form:radiobutton path="news_category" value="1"/>시스템점검
			<form:radiobutton path="news_category" value="2"/>극장
			<form:radiobutton path="news_category" value="3"/>행사/이벤트
			<form:radiobutton path="news_category" value="4"/>제휴이벤트
			<form:radiobutton path="news_category" value="5"/>기타
			<form:errors path="news_category" cssClass="error-color"/>
		</li>
		<li><b>내용</b></li>
		<li>
			<form:textarea path="news_content"/>
			<form:errors path="news_content" cssClass="error-color"/>
			<script>
				function MyCustomUploadAdapterPlugin(editor){
					editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						return new UploadAdapter(loader);
					}
				}
				
				//데이터를 넣어야하기 때문에 #content를 찾음 (에러 발생시 console에 찍기)
				ClassicEditor
					.create(document.querySelector('#news_content'),{
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
	<div>
		<form:button>수정</form:button>
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/news/detail?news_num=${newsVO.news_num}'">
	</div>
	</form:form>
</div>
<!-- 내용 끝 -->

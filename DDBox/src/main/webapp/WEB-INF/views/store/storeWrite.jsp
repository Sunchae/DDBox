<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>글쓰기</h2>
	<form:form action="write" modelAttribute="storeVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color" />		<%-- 오류가 날 수 있기때문에 맨 위쪽에 표시 --%>
		<ul>
			<li>
				<form:label path="store_title">제목</form:label>
				<form:input path="store_title"/>
				<form:errors path="store_title" cssClass="error-color" />
			</li>
			<li><b>내용</b></li>
			<li>
				<form:textarea path="store_content"/>
				<form:errors path="store_content" cssClass="error-color" />
			</li>
			<li>
				<form:label path="store_type">게시글 종류</form:label>
				<select id="store_type" name="store_type" class="type-select">
 					<option value="0" <c:if test="${store_type==0}">selected</c:if>>디디티켓</option>
 			 		<option value="1" <c:if test="${store_type==1}">selected</c:if>>팝콘/음료/굿즈</option>
				</select>
			<li>
				<form:label path="store_price">가격</form:label>
				<form:input path="store_price"/>
				<form:errors path="store_price" cssClass="error-color" />
			</li>
			<li>
				<form:label path="store_name">상품이름</form:label>
				<form:input path="store_name"/>
				<form:errors path="store_name" cssClass="error-color" />
			</li>
			<li>
				<form:label path="upload">파일업로드</form:label>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='storeTicketList'">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->
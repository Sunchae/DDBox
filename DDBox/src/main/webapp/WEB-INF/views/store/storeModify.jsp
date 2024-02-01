<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>글수정</h2>
	<form:form action="modify" modelAttribute="storeVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color" />
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
				<input type="number" name="price" id="price" min="1" class="input-check" max="99999999">
				<form:errors path="store_price" cssClass="error-color" />
			</li>
			<li>
				<form:label path="store_name">상품이름</form:label>
				<form:input path="store_name"/>
				<form:errors path="store_name" cssClass="error-color" />
			</li>
			<li>
				<form:label path="quantity">상품수량</form:label>
				<input type="number" name="quantity" id="quantity" class="input-check" min="0" max="99999">
			</li>
			<li>
				<form:label path="upload">파일업로드</form:label>
				<input type="file" name="upload" id="upload">
			</li>
			<li>
				<form:label path="store_status">상품표시여부</form:label>
				<input type="radio" name="store_status" value="1" id="status1">미표시
				<input type="radio" name="store_status" value="2" id="status2">표시
				<form:errors pat="store_status" cssClass="error-color" />
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='storeMainTest'">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->
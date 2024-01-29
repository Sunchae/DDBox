<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>단체/대관 문의</h2>
	<form:form action="write" modelAttribute="rentalVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="res_num">영화관 선택(*) (일단 ticket 임의값 넣고 1로 입력해서 해보기)</form:label>
				<form:input path="res_num"/>
				<form:errors path="res_num" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="rental_regdate">관람 희망일(*) (기본 날짜 입력해서 test)</form:label>
				<form:input path="rental_regdate"/>
				<form:errors path="rental_regdate" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="rental_per">희망인원(*)</form:label>
				<form:textarea path="rental_per"/>
				<form:errors path="rental_per" cssClass="error-color"/>
			</li>
	 		<li>
				<form:label path="rental_content">내용(*)</form:label>
				<form:textarea path="rental_content"/>
				<form:errors path="rental_content" cssClass="error-color"/>
			</li>
	 		<li>
				<form:label path="rental_name">문의자명(*)</form:label>
				<form:textarea path="rental_name"/>
				<form:errors path="rental_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="rental_phone">연락처(*)</form:label>
				<form:textarea path="rental_phone"/>
				<form:errors path="rental_phone" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="rental_email">이메일(*)</form:label>
				<form:textarea path="rental_email"/>
				<form:errors path="rental_email" cssClass="error-color"/>
			</li>
		</ul>
		<!-- 개인정보 수집 동의란 -->
		<div>
		<ul>
			<li>
			개인정보 수집 및 이용에 대한 동의
			</li>
			<li>
				<label>동의여부</label>
				<input type="radio" name="admitCheck" id="admit1" value="1">동의함
				<input type="radio" name="admitCheck" id="admit2" value="2">동의안함
			</li>
			<li>
				정보주체는 개인정보의 수집 및 이용을 거부할 권리가 있으나,
				문의 접수 및 회신을 위한 최소한의 개인정보만을 수집하기 때문에 이를 거부하실 경우에는 서비스 이용에 어려움이 있을 수 있습니다.
				그 밖의 사항은 CJ CGV의 개인정보처리방침에 따릅니다.
			</li>
		</ul>
		</div>
		<div class="align-center">
			<form:button>등록하기</form:button>
			<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/faq/rental'">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->

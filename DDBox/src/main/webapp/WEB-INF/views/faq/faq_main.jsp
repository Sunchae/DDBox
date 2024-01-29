<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SSH.css">
<!-- 내용 시작 -->
<div class="page-main">
	<div class="align-center">
	
		<div class="check_warp">
			<!-- 빠른검색 -->
			<div class="box qna_search">
				<b class="c_tit">자주찾는 질문 빠른 검색</b><br>
				<div class="search_box">
					<input id="keyword" type="text" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
					<button type="button" class="btn-search" title="검색하기" id="btn_search">검색</button>
				</div>
				<div class="qu">
					<a href="#">현금영수증</a>
					<a href="#">관람권</a>
					<a href="#">예매</a>
					<a href="#">환불</a>
					<a href="#">취소</a>
				</div>
			</div>
			<!-- 상담톡 -->
			<div class="quick_chat" style="cursor:pointer;">
				<b class="c_tit">상담톡 이용</b><br>
				<span>상담 톡을 이용해보세요.</span><br>
				<input type="button" onclick="" value="문의하기">
			</div>
			
			<div class="quick_email"  style="cursor:pointer;">
				<b class="c_tit">이메일 문의</b><br>
				<span>24시간 365일 언제든지 문의해주세요.</span><br>
				<input type="button" onclick="" value="문의하기">
			</div>
			
			<div class="quick_mypage"  style="cursor:pointer;">
				<b class="c_tit">내 상담 내역 확인</b><br>
				<span>문의하신 내용을 확인하실 수 있습니다.</span><br>
				<input type="button" onclick="" value="문의내역 조회">
			</div>
		</div>
	</div>
</div>
<!-- 내용 끝 -->
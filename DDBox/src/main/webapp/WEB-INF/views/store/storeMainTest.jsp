<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 내용 시작 -->
<div class="container">
	<div class="main-title" id="store_form">
		<div class="align-right">
			<c:if test="${user.mem_auth ==9}">
				<%-- 관리자 로그인 되어있을 때 만 보임 --%>
				<input type="button" value="글쓰기" onclick="location.href='write'">
			</c:if>
			<input type="button" value="결제테스트" onclick="location.href='${pageContext.request.contextPath}/kakaoPay/kakaoPay'">
		</div>
	</div>
	<div id="storeMainList">
<!-- contents start -->
		<div id="contents">
<!-- inner-wrap start -->
			<div class="inner-wrap">
				<h2 class="tit">스토어</h2>
				<div class="tab-list fixed">
					<ul>
						<li id="storeTab_ticketList">
							<a href="javascript:fn storeTabMove('ticketList')" title="디디티켓 탭으로 이동">디디티켓</a>
						</li>
						<li id="storeTab_popcorn">
							<a href="javascript:fn storeTabMove('popcorn')" title="팝콘/음료/굿즈 탭으로 이동">팝콘/음료/굿즈</a>
						</li>
					</ul>
				</div>
				<!-- 카테고리 별 상품 시작 -->
				<div id="divNewPrdtArea">
					<div class="tit-util mt70 mb15">
						<h3 class="tit">디디티켓</h3>
					</div>
					<div class="right">
						<a href="javascript:fn chgStoreTab('ticketList')" title="더보기">"더보기 "
							<i class="iconset ico-arr-right-gray"></i>
						</a>
					</div>
				</div>
<!-- store-list start -->
				<div class="store-list">
					<ul class="list">
						<li class="sold-out">
							<a href="javascript:fn storeDeatil('${store.store_num}')" title="${store.store_title}">
								<div class="soldout">SOLD OUT</div>
								<div class="label event">EVENT</div>
								<div class="img">
									<img alt="${store.store_title}" src="${pageContext.request.contextPath}/upload/${store.store_photo}" onerror="noImg(this);">
								</div>
								<div class="info">
									<div class="tit">
										<!-- 제품명 최대 2줄 -->
										<p class="name">${store.store_title}</p>
										<!-- 제품명 최대 2줄 -->
										<p class="bundle">${store.store_name}</p>
									</div>
									<div class="price">
										<p class="sale">
											<em>${store.store_price}</em>
											<span>원</span>
										</p>
									</div>
								</div>
							</a>
						</li>
					</ul>
				</div>
<!-- store-list end -->
				<!-- 카테고리 별 상품 끝 -->
				
			</div>
<!-- inner-wrap end -->
		</div>
<!-- contents end -->
	</div>
</div>
<!-- container end -->
<!-- 내용 끝 -->

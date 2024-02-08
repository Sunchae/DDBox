<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 내용 시작 -->
<div class="page-main">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/shop.cart.js"></script>
<div class="main-title" id="store_form">
		<div class="align-right">
			<c:if test="${user.mem_auth ==9}"> 		<%-- 관리자 로그인 되어있을 때 만 보임 --%>
			<input type="button" value="글쓰기" onclick="location.href='write'">
			</c:if>
		</div>
	</div>
	<c:if test="${store.store_status == 1}">
		<div class="result-display">
			<div class="align-center">
				본 상품은 판매 중지 되었습니다.
				<p>
				<input type="button" value="판매상품 보기" onclick="location.href='store/storeMainTest'">
			</div>
		</div>
	</c:if>
										<%-- contents --%>
	<c:if test="${store.store_status == 2}">										
	<div id="contents">
		<div class="inner-wrap">
			<!-- ::before -->
										<%-- store-detail --%>
			<div class="store-detail">
				<h2 class="tit">${store.store_title}</h2>
				<div class="sub-info">
					<p class="bundle"></p>
				</div>
										<%-- box-store-detail --%>
			<div class="box-store-detail">
			<!-- ::before -->
				<div class="left">
					<div class="img">
						<p>
							<img alt="${store.store_title}" src="${pageContext.request.contextPath}/upload/${store.store_photo}" onerror="noImg(this);">
						</p>
					</div>
					<p class="origin"></p>
				</div>
										<%-- right --%>
			<div class="right">
										<%-- goods-info --%>
				<div class="goods-info">
					<div class="line">
						<p class="tit">판매수량</p>
						<div class="cont">
							<div class="sale-count">
								<em>${quantity}</em>
								<span>100개 한정</span>
								" | "
								<span> 1회 2개 구매가능 </span>
								" | "
								<span> 1인 2개 구매가능 </span>
							</div>
						</div>
					</div>
					<div class="line">
						<p class="tit">구매 후 취소</p>
						<div class="cont">
							<p class="txt">
								"구매 후 취소가 불가한 상품입니다."
							</p>
						</div>
					</div>
				</div>
										<%-- goods-info end --%>
										<%-- type --%>
				<div class="type">
				<form id="store_cart">
					<input type="hidden" name="store_num" value="${store.store_num}" id="store_num">
					<input type="hidden" name="store_price" value="${store.store_price}" id="store_price">
					<input type="hidden" name="quantity" value="${store.quantity}" id="quantity">
					<p class="tit">
						<span class="line32">수량/금액</span>
					</p>
					<ul>
						<li>가격 : <b><fmt:formatNumber value="${store.store_price}"/>원</b></li>
						<li>재고 : <span><fmt:formatNumber value="${store.quantity}"/></span></li>
						<c:if test="${store.quantity > 0}">
						<li>
							<label for="order_quantity">구매수량</label>
							<input type="number" name="order_quantity" min="1" max="${quantity}" autocomplete="off" id="order_quantity" class="quantity-width">
						</li>
						<li>
							<span id="item_total_txt">총주문 금액 : 0원</span>
						</li>
						<li>
							<input type="submit" value="구매">
						</li>
						</c:if>
						<c:if test="${quantity <= 0}">
						<li class="align-center">
							<span class="sold-out">품절</span>
						</li>
						</c:if>
					</ul>
				</form>
				</div>
										<%-- type end --%>
			</div>
										<%-- right end --%>
			</div>
										<%-- box-store-detail end --%>
			</div>
										<%-- store-detail end --%>
										<%-- box-pulldown --%>
			<div class="box-pulldown">
				<div class="tit">
					<button type="button" class="btn-toggle">
						"구매 후 취소 "
						<i class="iconset ico-arr-toggle-down">내용보기</i>
					</button>
				</div>
				<div class="dotList02">
					"■&nbsp;교환 / 환불 / 사용기한 연장&nbsp;불가&nbsp;안내"
					<br>
					" - 본 상품은 이벤트 상품으로 &nbsp;"
					<span style="color:#e74c3c">
						<strong>
							<u>교환/환불/사용기한 연장&nbsp;절대&nbsp;불가</u>
						</strong>
					</span>
					"하니 신중하게 구매 부탁드립니다."
					<br>
					" - 본 권은 특가 상품으로 구매 후 미사용 하였더라도 취소가 일절 불가능 합니다."
					<br>
					" - 본 권은 영화 관람권 PIN 번호 1개당 4회 관람 가능한 권으로 4회 중 "
					<span style="color:#e74c3c">
						<strong>
							<u>잔여 미사용횟수가 남아 있더라도 개별 부분 환불이 불가능</u>
						</strong>
					</span>
					"합니다."
				</div>
			</div>
			<div class="box-pulldown">
				<div class="tit">
					<button type="button" class="btn-toggle">
					"구매 후 취소"
					<i class="iconset ico-arr-toggle-down">내용보기</i>
					</button>
				</div>
				<div class="dotList02">
					"■&nbsp;교환 / 환불 / 사용기한 연장&nbsp;불가&nbsp;안내"
					<br>
					" - 본 상품은 이벤트 상품으로&nbsp;"
					<span style="color:#e74c3c">
						<strong>
							<u>교환/환불/사용기한 연장&nbsp;절대&nbsp;불가</u>
						</strong>
					</span>
					"하니 신중하게 구매 부탁드립니다."
					<br>
					" - 본 권은 특가 상품으로 구매 후 미사용 하였더라도 취소가 일절 불가능 합니다."
					<br>
					" - 본 권은 영화 관람권 PIN 번호 1개당 4회 관람 가능한 권으로 4회 중"
					<span style="color:#e74c3">
						<strong>
							<u>잔여 미사용횟수가 남아 있더라도 개별 부분 환불이 불가능</u>
						</strong>
					</span>
					"합니다. "
				</div>
			</div>
										<%-- box-pulldown end --%>
			<!-- ::after -->
		</div>
	</div>
	</c:if>
										<%-- contents end --%>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${user.mem_auth ==9}">
		<input type="button" value="수정" onclick="location.href='update?store_num=${store.store_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.href='delete?store_num=${store.store_num}';
				}
			};
		</script>
		</c:if>

		<button id="check_module" type="button">구매</button>
		<script>
			$("#check_module").click(function() {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp66004703');
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
				IMP.request_pay({
					pg : 'kakaopay',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					/* 
					 *  merchant_uid에 경우 
					 *  https://docs.iamport.kr/implementation/payment
					 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
					 */
					name : '주문명 : ${store.store_title}',
					// 결제창에서 보여질 이름
					// name: '주문명 : ${auction.a_title}',
					// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
					amount : ${store.store_price},
					// amount: ${bid.b_bid},
					// 가격 
					buyer_name : '${member.mem_id}',
					// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
					// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
					buyer_postcode : '123-456',
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ${store.store_price}' + rsp.paid_amount;
						// success.submit();
						// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
						// 자세한 설명은 구글링으로 보시는게 좋습니다.
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			});
		</script>

		<input type="button" value="목록" onclick="location.href='storeMainTest'">
	</div>
</div>
<!-- 내용 끝 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
										<%-- contents --%>
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
								<em>300</em>
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
					<div class="receipt">
						<div class="line">
							<p class="tit">
								<span class="line32">수량/금액</span>
							</p>
							<div class="cont">
								<button type="button" class="btn minus" title="수량감소">
									<i class="iconset ico-minus"></i>
								</button>
								<input type="text" title="수량 입력" class="input-text" readonly="readonly" value="1">
								<button type="button" class="btn plus" title="수량증가">
									<i class="iconset ico-plus"></i>
								</button>
								<div class="money">
									<em id="prdSumAmt">60,000</em>
									<span>원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
										<%-- type end --%>
				<div class="btn-group">
					<!-- ::before -->
					<button type="button" class="button gray large" disabled="disabled">판매준비</button>
					<!-- ::after -->
				</div>
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
		<input type="button" value="목록" onclick="location.href='storeMain'">
	</div>
</div>
<!-- 내용 끝 -->

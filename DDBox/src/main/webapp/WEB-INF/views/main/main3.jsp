<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main3 내용 시작 -->
<div class="page-main">
	<div>
	 <h2> 상품 몇 개 나열</h2>
	 <div id="divNewPrdArea">
				<div class="store-list mt30">
					<ul class="list">
						<c:forEach var="store" items="${list}">
							<li>
								<a href="${pageContext.request.contextPath}/store/detail?store_num=${store.store_num}">
									<div class="img">
										<img alt="${store.store_content}"
											src="${pageContext.request.contextPath}/upload/${store.store_photo}">
									</div>
									<div class="info">
										<div class="tit">
											<p class="name">${store.store_title}</p>
											<p class="bundle">${store.store_content}</p>
										</div>
										<div class="price">
											<p class="original">${store.store_price}</p>
										</div>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
	</div>
</div>
<!-- Main3 내용 끝 -->

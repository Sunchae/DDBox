<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main2 내용 시작 -->
<body>
		<h2>이벤트 몇 가지</h2>
		<!-- 이벤트 목록 -->
		<div class="row mt-5">
			<!-- 이벤트 목록 반복 출력 -->
			<c:forEach var="event" items="${eventList}">
				<div class="event_list">
					<ul>
						<li class="list-card"><a
							href="detail?event_num=${event.event_num}">
								<p>
									<img
										src="${pageContext.request.contextPath}/upload/${event.event_photo1}"
										class="list-img">
								</p>
								<p class="tit">${event.event_title}</p>
								<p class="date">${event.event_start}~${event.event_end}</p>

						</a></li>
					</ul>
				</div>
			</c:forEach>
		</div>


<!-- Main2 내용 끝 -->
</body>
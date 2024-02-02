<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>${event_list.event_title}</h2>
	<div class="detail-info">
		<p>기간 ${event_list.event_start}~${event_list.event_end}</p>
	</div>
	<div class="detail-content">
		${event_list.event_content}
	</div>

	<c:if test="${fn:endsWith(event_list.event_photo2,'.jpg') || 
					fn:endsWith(event_list.event_photo2,'.JPG') ||
					fn:endsWith(event_list.event_photo2,'.jpeg') ||
					fn:endsWith(event_list.event_photo2,'.JPEG') ||
					fn:endsWith(event_list.event_photo2,'.gif') ||
					fn:endsWith(event_list.event_photo2,'.GIF') ||
					fn:endsWith(event_list.event_photo2,'.png') ||
					fn:endsWith(event_list.event_photo2,'.PNG')}">
	<div class="align-center">
		<img src="${pageContext.request.contextPath}/upload/${event_list.event_photo2}" class="detail-img">
	</div>
	</c:if>
	<div>
	<c:if test="${event_list.event_type == 2}">
		<fieldset id='btn_fieldset_${event_list.event_num}'>
                <input type="button" class="entry_btn" value="응모하기" onclick='entryButtonClick("${event_list.event_num}")' data-event_num="${event_list.event_num}">
            </fieldset>
	</c:if>		
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/event_entry.js"></script>
<!-- 내용 끝 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<div class="page-main">
	<h2>${question.board_title}</h2>
	<ul class="detail-info">
		<li>
			작성일 : ${question.board_regdate}
			조회 : ${question.board_hit}
		</li>
	</ul>
		<hr size="1" width="100%">
		<div class="detail-content">
			${question.board_content}
		</div>
		<hr size="1" width="100%">
		<div class="align-right">
			<c:if test="${!empty user && user.mem_num == board.mem_num}">
				<input type="button" value="수정" onclick="location.href='update?board_num=${question.board_num}'">
				<input type="button" value="삭제" id="delete_btn">
				<script type="text/javascript">
					let delete_btn = document.getElementById('delete_btn');
					delete_btn.onclick=function(){
						let choice = confirm('삭제하시겠습니까?');
					if(choice){
						location.href='delete?board_num=${board.board_num}'
					}
				};
			</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='list'">
	</div>
	<hr size="1" width="100%">
</div>
<!-- 내용 끝 -->
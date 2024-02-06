<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 시작 -->
<div class="page-main">
<h2>마이페이지 프로필관리</h2>
	<ul>
		<li>
			<img src="${pageContext.request.contextPath}/member/photoView"
			             width="200" height="200" class="my-photo">             
			<div class="camera" id="photo_btn">
				<img src="${pageContext.request.contextPath}/images/camera.png"
				                                                   width="35">
			</div>             
		</li>
		<li>
			<div id="photo_choice" style="display:none;">
				<input type="file" id="upload" 
				                         accept="image/gif,image/png,image/jpeg">
				<input type="button" value="전송" id="photo_submit">
				<input type="button" value="취소" id="photo_reset">                         
			</div>
		</li>
	</ul>
	
	<div>
		닉네임 변경 : 버튼 누르면 ajax처리로 input창 나와서 닉네임 입력 하는 칸 나오고 member_detail테이블 업데이트
	</div>
	
	
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.profile.js"></script>
<!-- 내용 끝 -->
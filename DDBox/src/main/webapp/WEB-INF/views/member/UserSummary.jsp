<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Summary 시작 -->
<div style="background-color: lightgray; padding: 20px; width: 45%;">
    <div style="display: flex; align-items: center;">
		<img src="${pageContext.request.contextPath}/member/photoView"
			alt="프로필 사진"
			style="width: 80px; height: 80px; border-radius: 50%; margin-right: 10px;">
		<div id="nickname-area">
			<span id="nickname-display">${user.mem_nickname}</span>
			<button id="edit-nickname">닉네임 변경</button>
		</div>
	</div>
    <hr>
    <div>
        <h4>회원 등급: ${user.mem_grade}</h4>
    </div>
    <div style="display: flex; justify-content: space-between; margin-top: 20px;">
        <div>
            <h4>보유 쿠폰 정보</h4>
            
        </div>
        <div>
            <h4>포인트 정보</h4>
            <p> 포인트</p>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var editButton = document.getElementById('edit-nickname');
    var nicknameDisplay = document.getElementById('nickname-display');
    var nicknameArea = document.getElementById('nickname-area');

    editButton.addEventListener('click', function() {
        var currentNickname = nicknameDisplay.innerText;

        // 입력 필드와 변경하기 버튼을 포함하는 div 생성
        var editDiv = document.createElement('div');
        editDiv.id = 'edit-div';

        var inputElement = document.createElement('input');
        inputElement.type = 'text';
        inputElement.id = 'nickname-input';
        inputElement.value = currentNickname;

        var saveButton = document.createElement('button');
        saveButton.innerText = '변경하기';
        saveButton.id = 'save-nickname';

        // div에 입력 필드와 버튼 추가
        editDiv.appendChild(inputElement);
        editDiv.appendChild(saveButton);

        // 닉네임 표시 영역을 새로운 div로 교체
        nicknameArea.replaceChild(editDiv, nicknameDisplay);
        inputElement.focus();

        // 변경하기 버튼 클릭 이벤트
        saveButton.addEventListener('click', function() {
            saveNickname(inputElement.value);
        });

        // 엔터키 이벤트
        inputElement.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                saveNickname(inputElement.value);
            }
        });
    });

    function saveNickname(newNickname) {
        // AJAX 요청으로 서버에 닉네임 변경 요청
        $.ajax({
            url: '${pageContext.request.contextPath}/member/changeNickname',
            type: 'POST',
            data: { nickname: newNickname },
            success: function(response) {
                // 성공 시 닉네임 표시 업데이트 및 원래 상태로 복귀
                nicknameDisplay.innerText = newNickname;
                nicknameArea.replaceChild(nicknameDisplay, document.getElementById('edit-div'));
            },
            error: function() {
                alert('닉네임 변경 실패');
                nicknameArea.replaceChild(nicknameDisplay, document.getElementById('edit-div'));
            }
        });
    }
});
</script>

<!-- Summary 끝 -->
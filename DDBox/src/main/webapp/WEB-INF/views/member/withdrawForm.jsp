<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <h2>회원 탈퇴</h2>
    <form action="/member/withdraw" method="post">
        <div>
            <label for="mem_pw">비밀번호:</label>
            <input type="password" id="mem_pw" name="mem_pw" required>
        </div>
        <div>
            <label for="verification">4자리 숫자 입력:</label>
            <input type="text" id="verification" name="verification" pattern="\d{4}" title="4자리 숫자를 입력하세요" required>
            <button type="button" onclick="generateRandomNumber()">난수 생성</button>
            <p id="randomNumber"></p>
        </div>
        <button type="submit">탈퇴하기</button>
    </form>

    <script>
        // 4자리의 난수 생성
        function generateRandomNumber() {
            var randomNumber = Math.floor(1000 + Math.random() * 9000);
            document.getElementById("randomNumber").textContent = "난수: " + randomNumber;
            document.getElementById("verification").value = ""; // 이전 입력값 초기화
        }
    </script>
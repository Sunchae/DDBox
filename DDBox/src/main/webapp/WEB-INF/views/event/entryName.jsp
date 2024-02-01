<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<div class="tit-util">
	<h3>당첨자 리스트</h3>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	
	<table class="striped-table" >
		<tr>
			<th>응모자 번호</th>
			<th>응모자 아이디</th>
			<th>응모자 참여 날짜</th>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr id="entry_table">
			<td class="align-center" id="entryNum">${list.entry_num}</td>
			<td class="align-center" id="memId">${list.mem_id}</td>
			<td class="align-center" id="entryDate">${list.entry_date}</td>
		</tr>
		</c:forEach>
	</table>
	
	<input type="button" value="추첨" id="entry" onclick="randomDraw(2)">
	<hr size="1" width="100%">
	<div id="winner-section" style="display:none;">
            <h3>추첨 결과</h3>
            <table id="winner-table" class="striped-table">
                <tr>
                    <th>당첨자 번호</th>
                    <th>당첨자 아이디</th>
                    <th>당첨 날짜</th>
                </tr>
            </table>
        </div>
	</div>
</div>
<script>
    function randomDraw(numberOfWinners) {
        // 버튼을 비활성화.
        document.getElementById('entry').disabled = true;

        // 테이블 행을 가져옴.
        let rows = document.querySelectorAll('#entry_table');

        // 헤더 행을 제거.(추첨할 데이터가 아니기 때문에)
        rows = Array.from(rows).slice(1);

        // 당첨자를 저장할 배열을 초기화.
        let winners = [];

        // 지정된 인원수만큼 무작위로 당첨자를 선택.
        if (numberOfWinners > 0) {
	        for (let i = 0; i < numberOfWinners; i++) {
	            let winnerIndex = Math.floor(Math.random() * rows.length);
	            let winner = rows[winnerIndex];
	
	            // 당첨자 표시
	            winner.style.backgroundColor = '#FFFF00';
	
	            // 당첨자의 데이터를 추출하고 배열에 추가합니다.
	            let winnerEntryNum = winner.querySelector('#entryNum').innerText;
	            let winnerMemId = winner.querySelector('#memId').innerText;
	            let winnerEntryDate = winner.querySelector('#entryDate').innerText;
				
	         // 중복 확인
	            let isDuplicate = winners.some(existingWinner => existingWinner.memId === winnerMemId);
	            
	         // 중복되지 않으면 배열에 추가
	            if (!isDuplicate) {
	                winners.push({
	                    entryNum: winnerEntryNum,
	                    memId: winnerMemId,
	                    entryDate: winnerEntryDate
	                });

	                // 선택된 당첨자를 배열에서 제거하여 중복 선택을 방지.
	                rows.splice(winnerIndex, 1);
	            } else {
	                // 중복되면 다시 한 번 뽑기
	                i--;
	            }
	        }
        }

        // 결과 섹션에 당첨자의 데이터를 표시.
        displayWinners(winners);

    }

    function displayWinners(winners) {
        document.getElementById('winner-section').style.display = 'block';
        let winnerTable = document.getElementById('winner-table');

        // 선택된 당첨자를 표에 추가.
        winners.forEach(winner => {
            let winnerRow = winnerTable.insertRow(-1);
            let cell1 = winnerRow.insertCell(0);
            let cell2 = winnerRow.insertCell(1);
            let cell3 = winnerRow.insertCell(2);
            cell1.innerHTML = winner.entryNum;
            cell2.innerHTML = winner.memId;
            cell3.innerHTML = winner.entryDate;
        });
    }
</script>
<!-- 내용 끝 -->
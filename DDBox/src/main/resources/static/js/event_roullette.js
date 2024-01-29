const $c = document.querySelector("canvas");
const ctx = $c.getContext(`2d`);
// 룰렛 항목과 색상 정의
const point = ["0point", "100point", "200point", "300point", "400point", "500point"];
const colors = ["#dc0936", "#e6471d", "#f7a416", "#efe61f", "#60b236", "#209b6c"];

// 룰렛 그리기 함수
const newMake = () => {
    const [cw, ch] = [$c.width / 2, $c.height / 2];
    const arc = Math.PI / (point.length / 2);
  
    // 룰렛 항목 영역 그리기
    for (let i = 0; i < point.length; i++) {
      ctx.beginPath();
      ctx.fillStyle = colors[i % (colors.length)];
      ctx.moveTo(cw, ch);
      ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
      ctx.fill();
      ctx.closePath();
    }

    // 항목 텍스트 그리기
    ctx.fillStyle = "#fff";
    ctx.font = "18px Pretendard";
    ctx.textAlign = "center";

    for (let i = 0; i < point.length; i++) {
      const angle = (arc * i) + (arc / 2);

      ctx.save();
      ctx.translate(
        cw + Math.cos(angle) * (cw - 50),
        ch + Math.sin(angle) * (ch - 50),
      );
      ctx.rotate(angle + Math.PI / 2);

      point[i].split(" ").forEach((text, j) => {
        ctx.fillText(text, 0, 30 * j);
      });

      ctx.restore();
    }
}


// 룰렛 회전 함수
const rotate = () => {
  $c.style.transform = `initial`;
  $c.style.transition = `initial`;
  
  setTimeout(() => {
    // 랜덤으로 포인트 선택
    const ran = Math.floor(Math.random() * point.length);

    // 회전 각도 계산 및 적용
    const arc = 360 / point.length;
    const rotate = ((ran-1) * arc) + 3600 + (arc * 3) - (arc/4);
    
    $c.style.transform = `rotate(-${rotate}deg)`;
    $c.style.transition = `2s`;
    
    // 결과 알림창 표시
    setTimeout(() => alert(`${point[ran]}가 적립되었습니다.`), 2000);
  }, 1);
};

// 초기 룰렛 그리기
newMake();
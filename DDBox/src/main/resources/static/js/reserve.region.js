function categoryChange(e) {
  const state = document.getElementById("state");

  const seoul = ["방학","동대문","명동","천호","연남","성신여대입구","Salon 서초","피카디리1958","청담씨네시티","강변","구로","압구정","명동역 씨네라이브러리","등촌","송파","수유","하계","여의도","건대입구","중계","강남","불광","홍대","영등포","상봉","미아","대학로","용산아이파크몰","왕십리","신촌아트레온"];
  const gyeonggi = ["배곧","시흥","동수원","야탑","김포한강","고양행신","의정부태흥","하남미사","용인","오산","부천","성남모란","화성봉담","광교상현","평택소사","서현","구리","경기광주","화정","파주문산","김포운양","일산","소풍","평택","안성","동탄","동탄그랑파사쥬","동두천","신세계경기","구리갈매","남양주 화도","고양백석","부천역","평촌","판교","북수원","DRIVE IN 용인크랙사이드","산본","부천옥길","정왕","다산","안산","오리","광명역","동백","평택고덕","DRIVE IN 곤지암","기흥","역곡","범계","김포","동탄역","광교","동탄호수공원","스타필드시티위례","포천","파주야당","이천","의정부","오산중앙","양주옥정"];
  const incheon = ["인천논현","인천연수","인천도화","부평","계양","송도타임스페이스","인천가정","인천학익","연수역","인천시민공원","인천","주안","DRIVE IN 스퀘어원","청라"];
  const gangwon= ["인제","원주","강릉","기린","원릉","춘천"];
  const daejeon = ["유성노은","대전탄방","대전가오","대전가수원","대전","대전터미널","천안터미널","서산","아산","홍성","천안펜타포트","당진","보령","논산","천안","천안시청","충주교현","청주성안길","청주(서문)","충북혁신","청주율량","청주터미널","제천"];
  const daegu = ["대구현대","대구죽전","대구","대구칠곡","대구한일","대구연경","대구월성","대구아카데미","대구수성","대구스타디움"];
  const busan = ["울산동구","울산진장","울산신천","울산삼산","서면상상마당","하단아트몰링","정관","DRIVE IN 영도","서면","부산명지","서면삼정타워","해운대","화명","대연","센텀시티","아시아드","동래"];
  const gyeongsang = ["진주혁신","양산삼호","창원상남","창원","창원더시티","김해율하","고성","거제","김해","김해장유","마산","안동","김천율곡","구미","북포항","경산"];
  const gwangju = ["광주용봉","광주하남","광주충장로","광주터미널","광주상무","광주첨단","광주금남로","목포","나주","광양","여수웅천","목포평화광장","순천","순천신대","광양엘에프스퀘어","정읍","익산","전주고사","서전주","전주효자","군산","전주에코시티","제주노형","제주"];
  

  if (e.value == "general01") {
    add = seoul;
  } else if (e.value == "general02") {
    add = gyeonggi;
  } else if (e.value == "general03") {
    add = incheon;
  } else if (e.value == "general04") {
    add = gangwon;
  } else if (e.value == "general05") {
    add = daejeon;
  } else if (e.value == "general06") {
    add = daegu;
  } else if (e.value == "general07") {
    add = busan;
  } else if (e.value == "general08") {
    add = gyeongsang;
  } else if (e.value == "general09") {
    add = gwangju;
  } 

  state.options.length = 0;
  // 군/구 갯수;

	for (property in add) {
		let opt = document.createElement("option");
		opt.value = add[property];
		opt.innerHTML = add[property];
		state.appendChild(opt);
		
	}
	
	$(document).on('click','#region_choice', function(){
		let scr_do = $(this).parent().find('#state').val();
		let scr_si = $(this).parent().find('option').val();
		
		let regionUI = '<p id="region">';
			regionUI += $('#state').val() + $('#region_choice').val();
			regionUI += '</p>';
			
		$(this).parent('.check_content').hide();
		$(this).parent('p').appenmd(regionUI);
	});
	
}
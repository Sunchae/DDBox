$(function(){
    // 새로고침 시 상태 복원
    const entry_btn_elements = document.querySelectorAll('.entry_btn');
    entry_btn_elements.forEach(function(entry_btn_element) {
        let event_num = entry_btn_element.dataset.event_num;
        if (localStorage.getItem(`entry_btn_disabled_${event_num}`) == 'true') {
            fieldsetDisable(event_num);
        }
    });
});

function entryButtonClick(event_num) {
    // 서버와 통신
    $.ajax({
        url: 'entryinsertAjax',
        type: 'post',
        data: { event_num: event_num },
        dataType: 'json',
        success: function (param) {
            if (param.result == 'logout') {
                alert('로그인해야 사용할 수 있습니다.');
            } else if (param.result == 'success') {
                alert('응모되었습니다.');

                // 로컬 스토리지에 상태 저장
                localStorage.setItem(`entry_btn_disabled_${event_num}`, 'true');
                fieldsetDisable(event_num);
            }
        },
        error: function () {
            alert('네트워크 오류 발생');
        }
    });
}

function fieldsetDisable(event_num) {
    const fieldset = document.getElementById(`btn_fieldset_${event_num}`);
    if (fieldset) {
        fieldset.disabled = true;
    }
}
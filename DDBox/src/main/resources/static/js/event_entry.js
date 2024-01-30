$(function(){//로그인 확인...
	$('#entry_btn').click(function(event){
		let event_num = $(this).data('event_num');
		//서버와 통신
		$.ajax({
			url:'entryinsertAjax',
			type:'post',
			data:{event_num:event_num},
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 사용할 수 있습니다.');
				}else if(param.result == 'success'){
					alert('응모되었습니다.');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		event.preventDefault();
	});
});	
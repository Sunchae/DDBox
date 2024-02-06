/*$(function(){
	$('#order_quantity').on('keyup mouseup',function(){
		if($('#order_quantity').val()==''){
			$('#item_total_txt').text('총 주문 금액 : 0원');
			return;
		}
		if($('#order_quantity').val()<=0){
			$('#order_quantity').val('');
			return;
		}
		if(Number($('#quantity').val()) < $('#order_quantity').val()){
			alert('수량이 부족합니다.');
			$('#order_quantity').val('');
			$('#item_total_txt').text('총 주문 금액 : 0원');
			return;
		}
		
		let total = $('#store_price').val() * $('#order_quantity').val();
		$('#item_total_txt').text('총 주문 금액 : ' + total.toLocaleString()+'원');
	}); //end of on
	
	//장바구니 담기 이벤트 연결
	$('#store_cart').submit(function(event){
		if($('#order_quantity').val() == ''){
			alert('수량을 입력하세요');
			$('#order_quantity').focus();
			return false;
		}
		
		let form_data = $(this).serialize();
		//서버와 통신
		$.ajax({
			url:'insert',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 사용하세요');
				}else if(param.result == 'success'){
					alert('장바구니에 담았습니다.');
					location.href='cartList';
				}else if(param.result == 'overquantity'){
					alert('기존의 주문한 상품입니다. 개수를 추가하면 재고가 부족합니다.');
				}else{
					alert('장바구니 담기 오류')
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
		
	});
	
	
});*/
$(function(){
	let quantity = $(".quantity_input").val();
	$(".btn_plus").on("click",function(){
		$(".quantity_input").val(++quantity);
	});
	$(".btn_minus").on("click",function(){
		if(quantity >1){
			$(".quantity_input").val(--quantity);
		}
	});
	const form = {
			memberId : '${mem.mem_num}',
			store_num : '${store.store_num}',
			sub_total : ''
	}
	$(".btn_cart").on("click", function(e){
		form.sub_total= $("quantity_input").val();
		$.ajax({
			url : "/cart/insert",
			type : "POST",
			data : form,
			dataType : 'json',
			success : function(result){
					cartAlert(result);	
			}
		});
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가 하지 못하였습니다.");
		}else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		}else if(result == '2'){
			alert("장바구니에 이미 추가되었습니다.");
		}else if(result == '5'){
			alert("로그인이 필요합니다.");
		}
	}
	
});
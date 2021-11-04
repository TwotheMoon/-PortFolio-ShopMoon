let moveForm = $("#midiDetail_moveForm");

	// 바로구매 버튼 
/*	$(".productDetail_linkProductListBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=productNo]").remove();
		moveForm.attr("action", "/admin/productList");
		moveForm.submit();
		
	});
	
	// 장바구니 버튼
	$(".productDetail_modifyWriteBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/productModify");
		moveForm.submit();
		
	});*/
	
	// 기타 목록 페이지 이동 버튼
	$(".midiDetail_linkGuitarListBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=productNo]").remove();
		moveForm.attr("action", "/shop/midiList");
		moveForm.submit();
		
	});
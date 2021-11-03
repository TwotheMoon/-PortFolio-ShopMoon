let moveForm = $("#productDetail_moveForm");

	// 상품 목록 페이지 이동 버튼 
	$(".productDetail_linkProductListBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=productNo]").remove();
		moveForm.attr("action", "/admin/productList");
		moveForm.submit();
		
	});
	
	// 상품 수정 페이지 이동 버튼
	$(".productDetail_modifyWriteBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/productModify");
		moveForm.submit();
		
	});
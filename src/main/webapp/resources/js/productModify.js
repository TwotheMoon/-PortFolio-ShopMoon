let moveForm = $("#productModify_moveForm");
let modifyForm = $(".productModify_form");

	// 취소 버튼 (상세 페이지 리턴)
	$(".productModify_linkProductListBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/productDetail");
		moveForm.submit();
	});
	
	// 상품 수정 버튼 및 유효성 검사
	$(".productModify_modifyWriteBtn").on("click", function(e){

		modifyForm.submit();	
		
		});
		
	// 상품 삭제 버튼
	$(".productModify_modifyDeleteBtn").on("click", function(e){
	
		e.preventDefault();
	
		moveForm.append('<input type="hidden" name="productNo" value="${productInfo.productNo}">');
		moveForm.attr("action", "/admin/productDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});

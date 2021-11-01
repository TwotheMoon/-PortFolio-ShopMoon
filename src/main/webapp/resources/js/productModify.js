let moveForm = $("#productModify_moveForm");
let modifyForm = $(".productModify_form");

	// 취소 버튼 (상세 페이지 리턴)
	$(".productModify_linkProductListBtn").on("click", function(e){
		
		e.preventDefault();
				
		moveForm.attr("action", "/admin/productDetail")
		moveForm.submit();
	});
	
	// 상품 수정 버튼 및 유효성 검사
	$(".productModify_modifyWriteBtn").on("click", function(e){

		modifyForm.submit();	
		
			
		});

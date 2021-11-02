let moveForm = $("#productDetail_moveForm");

	$(document).ready(function(){
		// 이미지 정보 호출
		let productNo = '<c:out value="${productInfo.productNo}">';
		let uploadResult = $("#uploadResult");
		
		$.getJSON("/admin/getAttachList", {productNo : productNo}, function(arr){
			
			if(arr.length === 0){
				let str = "";
				str += "<div id='result_card'>";
				str += "<img src='${path}/resources/img/noImg.png'>";
				str += "</div>";
					
				uploadResult.html(str);
				return;
			}
			
			let str = "";
			let obj = arr[0];
		
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";	
			
			uploadResult.html(str);
		});
	});

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
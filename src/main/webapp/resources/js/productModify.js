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
	
	//이미지 삭제 버튼
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	// 파일 삭제 메서드
	function deleteFile(){
		
		$("#result_card").remove();
		
	}
	
	/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	
	/* 이미지 존재시 삭제 */
	if($("#result_card").length > 0){
		deleteFile();
	}
	
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
		
		formData.append("uploadFile", fileObj);
	
		$.ajax({
			url: '/admin/uploadAjaxImg',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
			success : function(result){
	    		console.log(result);
				showUploadImage(result);
	    	},
			error: function(result){
				alert("이미지 파일이 아니에요");
			}
		});
});

/* 파일 메소드 확장자 유효성 */
let regex = new RegExp("(.*?)\.(jpg|png)$");
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("jpg, png 파일만 업로드 할 수 있어요.");
		return false;
	}
	
	return true;		
		
}
	
/* 이미지 출력 */
function showUploadImage(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = $("#uploadResult");
	
	let obj = uploadResultArr[0];
	
	let str = "";
	
	// 한글파일 깨짐 방지, 서버 업로드 이미지 및 삭제 버튼 구현
	let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";
		
	uploadResult.append(str);   
}


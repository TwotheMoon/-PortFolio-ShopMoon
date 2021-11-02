const enrollForm = $(".productEnrollBox_form")
	
/* 취소 버튼 */
$(".productEnroll_cansleBtn").click(function(){
	
	location.href="/admin/adminMain"
	
});

/* 상품 등록 버튼 */
$(".productEnrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	enrollForm.attr("action", "/admin/productEnroll")
	enrollForm.submit();
	
});

/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	
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
	let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn'>x</div>";
		str += "</div>";
		
	uploadResult.append(str);   
}


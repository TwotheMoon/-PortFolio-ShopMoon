let moveForm = $("#contactModify_moveForm");
let modifyForm = $(".contactModify_form");

	// 취소 버튼 (상세 페이지 리턴)
	$(".contactModify_modifyCancleBtn").on("click", function(e){
		
		e.preventDefault();
				
		moveForm.attr("action", "/community/contactDetail");
		moveForm.submit();
	});
	
	// 문의 글 수정 버튼 및 유효성 검사
	$(".contactModify_comitBtn").on("click", function(e){

		let contactTitle = $(".contactModify_title").val();
		let contactContents = $(".contactModify_contents").val();		

		let	titleCk = false;
		let contentsCk = false;		
		
		e.preventDefault();
		
		if(contactTitle == null){
			$("#warn_contactTitle").css("display", "block");
		} else {
			$("#warn_contactTitle").css("display", "none");
			titleCk = true;
		}
		if(contactContents == null){
			$("#warn_contactContents").css("display", "block");
		} else {
			$("#warn_contactContents").css("display", "none");
			contentsCk = true;
		}

		
		if(titleCk == true && contentsCk == true){
			modifyForm.submit();	
		} else {
			return false;
		}
	});

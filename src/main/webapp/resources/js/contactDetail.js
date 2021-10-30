let moveForm = $("#contactDetail_moveForm");

	// 문의 글 목록 페이지 이동 버튼 
	$(".contactDetail_linkContactListBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=contactNo]").remove();
		moveForm.attr("action", "/community/contactList");
		moveForm.submit();
		
	});
	
	// 문의 글 수정 페이지 이동 버튼
	$(".contactDetail_modifyWriteBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/community/contactModify");
		moveForm.submit();
		
	});
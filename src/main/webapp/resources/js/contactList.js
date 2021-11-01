
let moveForm = $("#contactList_moveForm");
let searchForm = $("#contactListSearchForm");

// 페이지 이동 
$(".pageMakerBtn a").on("click", function(e){
    
    e.preventDefault();
    
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.submit();
});

// 검색 버튼
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!contactListSearchForm.find("input[name='keyword']").val()){
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();	
});


// 글 작성 버튼 유효성
$(".contactBox_board_writeBtn").click(function(){
	
	$(location).attr("href", "/community/contactWriteView");
});


// 상세 페이지 이동
$(".contactDetail").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='contactNo' value='"+ $(this).attr("href") + "'>");
	moveForm.attr("action", "/community/contactDetail");
	moveForm.submit();
	
});

// 삭제 결과 경고창 
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제 완료");
	} 	




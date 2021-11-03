
let moveForm = $("#productList_moveForm");
let searchForm = $("#productListSearchForm");

// 페이지 이동 
$(".pageMakerBtn a").on("click", function(e){
    
    e.preventDefault();
    
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.submit();
});

// 검색 버튼
$("#productListSearchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();	
});


// 글 작성 버튼 
$(".productListBox_board_writeBtn").click(function(){
	
	$(location).attr("href", "/admin/productEnrollView");
});


// 상세 페이지 이동
$(".productList").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='productNo' value='"+ $(this).attr("href") + "'>");
	moveForm.attr("action", "/admin/productDetail");
	moveForm.submit();
	
});

// 삭제 결과 경고창 
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제 완료");
	}
	
	




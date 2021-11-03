
let moveForm = $("#guitarList_moveForm");
let searchForm = $("#guitarListSearchForm");

// 페이지 이동 
$(".pageMakerBtn a").on("click", function(e){
    
    e.preventDefault();
    
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.submit();
});

// 검색 버튼
$("#guitarListSearchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();	
});


// 상세 페이지 이동
$(".guitarList").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='productNo' value='"+ $(this).attr("href") + "'>");
	moveForm.attr("action", "/admin/productDetail");
	moveForm.submit();
	
});





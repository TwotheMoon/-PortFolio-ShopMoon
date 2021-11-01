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




$(".loginBtn").click(function(){
	$(".loginBox_form").attr("action", "/member/login");
	$(".loginBox_form").submit();	
});
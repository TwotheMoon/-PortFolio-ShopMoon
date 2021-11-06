
// 아이디 찾기 메소드
$(".findIdBtn").click(function(){
	$(".findIdBox_form").attr("action", "/member/findId");
	$(".findIdBox_form").submit();	
});

// 로그인으로 돌아가기
$(".redirectHomeBtn").click(function(){

	location.replace("/member/login");
	
});
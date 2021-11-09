
// 비밀번호 찾기 메소드
$(".findPwBtn").click(function(){
	$(".findPwBox_form").attr("action", "/member/findPw");
	$(".findPwBox_form").submit();	
});

// 로그인으로 돌아가기
$(".redirectHomeBtn").click(function(){

	location.replace("/member/login");
	
});
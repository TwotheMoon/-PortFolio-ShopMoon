
// 비밀번호 찾기 메소드
$(".findPwBtn").click(function(){
	$.ajax({
		url : "/member/findPw",
		type : "POST",
		data : {
			memberId : $(".findPwId").val(),
			memberPw : $(".findPwEmail").val()
		},
		success : function(result) {
			// 서비스에서 처리			
			alert(result);
		}
	});
});

// 로그인으로 돌아가기
$(".redirectHomeBtn").click(function(){

	location.replace("/member/login");
	
});
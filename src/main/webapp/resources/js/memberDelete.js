
// 회원탈퇴
$(".deleteMemberViewBtn").click(function(){
	$(".deleteMemberView_form").attr("action", "/member/memberDelete");
	$(".deleteMemberView_form").submit();	
});




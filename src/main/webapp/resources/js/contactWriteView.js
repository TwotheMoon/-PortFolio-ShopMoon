

$(".contactWriteView_writeBtn").click(function(){
	$(".contactWriteViewBox_writeForm").attr("action", "/contact/contactWrite");
	$(".contactWriteViewBox_writeForm").submit();	
});
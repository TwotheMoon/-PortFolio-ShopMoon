

$(".contactWriteView_writeBtn").click(function(){
	$(".contactWriteViewBox_writeForm").attr("action", "/community/contactWrite");
	$(".contactWriteViewBox_writeForm").submit();	
});
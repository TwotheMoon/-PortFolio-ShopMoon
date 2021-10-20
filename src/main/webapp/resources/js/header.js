
// 시계
const clock = document.querySelector(".headerClock");

function getCLock(){
	const date = new Date();
	const hours = date.getHours();
	const minutes = (String)(date.getMinutes()).padStart(2, "0");
	const seconds = (String)(date.getSeconds()).padStart(2, "0");
	
	clock.innerText = `${hours}:${minutes}:${seconds}`;
}
getCLock();
setInterval(getCLock, 1000);

// 메뉴 슬라이드
$(function () {
    const $aside = $(".menuBox"),
        $button = $(".headerMenuBtn"),
		$sactionBox = $(".sactionBox").not(this),
		$footerBox = $(".footerBox").not(this),
        $duration = 400;

    $button.click(function () {
        $aside.toggleClass("menu-open");
        if ($aside.hasClass("menu-open")) {
			$button.animate({ right: "272px" }, $duration);
            $aside.stop().animate({ right: "0px"}, $duration);
			$sactionBox.animate({ opacity: "20%"}, $duration);
			$footerBox.animate({ opacity: "20%"}, $duration);
        } else {
			$button.animate({ right: "20px" }, $duration);
            $aside.stop().animate({ right: "-272px" }, $duration);
			$sactionBox.animate({ opacity: "100%"}, $duration);  
			$footerBox.animate({ opacity: "100%"}, $duration);		      
		}
    });
});

// 메뉴 리스트 드롭다운
$(function () {
	const $aboutBtn = $(".menuBox_about"),
		$aboutList = $(".aboutlist")
		
	$(function() {
		$aboutList.hide();
		$aboutBtn.click(function(){
			$aboutList.slideToggle();
		})
	})
});

$(function () {
	const $shopBtn = $(".menuBox_shop"),
		$shopList = $(".shoplist")
		
	$(function() {
		$shopList.hide();
		$shopBtn.click(function(){
			$shopList.slideToggle();
		})
	})
});

$(function () {
	const $communityBtn = $(".menuBox_community"),
		$communityList = $(".communitylist")
		
	$(function() {
		$communityList.hide();
		$communityBtn.click(function(){
			$communityList.slideToggle();
		})
	})
});










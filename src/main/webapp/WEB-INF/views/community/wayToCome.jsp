<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 구글맵 api -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyByI3oS_skzo-uFYCpW7Y34CmKXCsfUxsI" ></script>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="wayToComeBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    	<!-- 구글맵 api -->
<script type="text/javascript">
	$(document).ready(function() {
		var myLatlng = new google.maps.LatLng(37.475479,126.914402); // 위치값 위도 경도
		var Y_point			= 37.475479;		// Y 좌표
		var X_point			= 126.914402;		// X 좌표
		var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
		var markerTitle		= "서울시 미성동";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
		var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기
	
	// 말풍선 내용
		var contentString	= '<div>' +
		'<h2>ShopMoon</h2>'+
		'<p>언제든 방문을 환영합니다.</p>' +
		
		'</div>';
		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var mapOptions = {
							zoom: zoomLevel,
							center: myLatlng,
							mapTypeId: google.maps.MapTypeId.ROADMAP
						}
		var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
		var marker = new google.maps.Marker({
												position: myLatlng,
												map: map,
												title: markerTitle
		});
		var infowindow = new google.maps.InfoWindow(
													{
														content: contentString,
														maxWizzzdth: markerMaxWidth
													}
				);
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	});
</script>
    
	<!-- wayToCome.jsp 컨텐츠 -->
	<section class="wayToComeBox opacityBox" >
	
		<div class="wayToComeBox_title">
			<h1>Way To Come</h1>
		</div>
		
		<div class="wayToComeBox_nav">
			<a href="/community/contactList">Contact</a> |
			<a href="/wayToCome">Way To Come</a>
		</div>
		
		<img class="wayToComeMap_img" data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/community/wayToComeImg01.png">
		<!-- 구글 맵 -->
		<div id="map_ma"></div>
		
		<div class="wayToComeBox_contentsBox">
			<div class="wayToComeBox_contents_title"> 주식회사 샾문 </div>
			<div class="wayToComeBox_contents">
				<div class="wayToComeBox_contents_text-title">
					<div>주소</div>
					<div>연락처</div>
					<div>오시는길</div>
				</div>
				<div class="wayToComeBox_contents_text-contents">
					<div>08880 서울시 관악구 문성로 16가길 31</div>
					<div>02)1500-1501</div>
					<div>(2호선) 신림역 4번출구 10분거리</div>
				</div>
			</div>
		</div>
		
	</section>
	
	<footer class="wayToComeFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

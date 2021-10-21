<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- jsp 캐시 사용 안함 설정 -->
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<!-- css -->
<link href="${path}/resources/css/home.css" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-iKbFRxucmOHIcpWdX9NTZ5WETOPm0Goy0WmfyNcl52qSYtc2Buk0NCe6jU1sWWNB" crossorigin="anonymous">
<link rel="icon" href="img/favicon.png">
<!-- js -->
<script src="${path}/resources/js/about.js" async></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	
	<title> All Brand - #Moon </title>
</head>
<body id="allBrandBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    
<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>

<section class="allBrandBox" >

	<div class="allBrandSection_title">
		<h1>All Brand</h1>
	</div>
	
	<div class="allBrandSection_nav">
		<a href="/about">ABOUT #Moon</a> |
		<a href="/allBrand">All Brand</a>
	</div>
	
	<div class="allBrandSectionBox_column1">
		<img data-aos="fade-down"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrandImg01.jpg">
		<div data-aos="fade-up"  data-aos-easing="ease-in-out" data-aos-duration="1000" data-aos-delay="50">
			<p>What's your BRAND DNA?</p>
			<p>
				<br>
				어떤 브랜드가 취향이세요? <br>
				저희 #Moon과 함께하는 브랜드와 <br>
				멋진 음악, 행복한 음악 만들어요! <br>
			</p>
		</div>
	</div>
	
	<div class="allBrandSectionBox_column2">
		<div class="allBrandMiniLogo-title" data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000">Main Partners</div>
		<div class="allBrandMiniLogos" data-aos="fade-up"  data-aos-easing="ease-in-out" data-aos-duration="1000">
			<img src="${path}/resources/img/allBrandImgSmall01.png">
			<img src="${path}/resources/img/allBrandImgSmall02.png">
			<img src="${path}/resources/img/allBrandImgSmall03.png">
			<img src="${path}/resources/img/allBrandImgSmall04.png">
			<img src="${path}/resources/img/allBrandImgSmall05.png">
			<img src="${path}/resources/img/allBrandImgSmall06.png">
		</div>
	</div>
	
	<div class="allBrandbigLogo-title" data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000">Others</div>
	
	<div class="allBrandSectionBox_column3">
		<img data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrandImgBig01.jpg">
	</div>
	<div class="allBrandSectionBox_column4">
		<img data-aos="fade-left"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrandImgBig02.jpg">
	</div>
	<div class="allBrandSectionBox_column5">
		<img data-aos="zoom-in"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrandImgBig03.jpg">
	</div>
	<div class="allBrandSectionBox_column6">
		<img data-aos="zoom-in"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrandImgBig04.jpg">
	</div>
	<div class="allBrandSectionBox_column7">
		<img data-aos="zoom-in"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrandImgBig05.jpg">
	</div>
	<div class="allBrandSectionBox_column8">
		<img data-aos="zoom-in"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrandImgBig06.jpg">
	</div>
	
</section>

<footer class="footerBox" >
	<jsp:include page="includes/footer.jsp" />
</footer>


</body>
</html>

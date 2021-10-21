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
<body class="allBrandBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    
<header class="headerBox" >
	<jsp:include page="header.jsp" />
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
		<img data-aos="fade-down"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/aboutImg02.jpg">
		<div data-aos="fade-up"  data-aos-easing="ease-in-out" data-aos-duration="1000" data-aos-delay="50">
			<p>음악과 관련된 사람이라면</p>
			<p>
				<br>
				당신은 어떤 사람인가요? <br>
				음악을 만드는 사람, <br>
				만든 음악을 연주하는 사람, <br>
				그리고 완성된 음악을 듣는사람, <br><br>
				혹은 당신이 위에 사람들에 해당 되지 않는다 해도 <br>
				괜찮습니다. 저희는 언제나 환영합니다.
			</p>
		</div>
	</div>
	
</section>

<footer class="footerBox" >
	<jsp:include page="footer.jsp" />
</footer>


</body>
</html>

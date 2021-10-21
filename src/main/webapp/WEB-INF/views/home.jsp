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
<link href="${path}/resources/css/common.css" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-iKbFRxucmOHIcpWdX9NTZ5WETOPm0Goy0WmfyNcl52qSYtc2Buk0NCe6jU1sWWNB" crossorigin="anonymous">
<link rel="icon" href="img/favicon.png">
<!-- js -->
<script src="${path}/resources/js/home.js" async></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	
	<title>:: #Moon - Welcome to VACUUM ::</title>
</head>
<body class="homeBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    
<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>

<section class="sectionBox" >
	<jsp:include page= "includes/section.jsp" />
</section>

<footer class="footerBox" >
	<jsp:include page="includes/footer.jsp" />
</footer>

</body>
</html>

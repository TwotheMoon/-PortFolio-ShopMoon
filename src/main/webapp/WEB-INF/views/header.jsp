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

<html>
<head>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-iKbFRxucmOHIcpWdX9NTZ5WETOPm0Goy0WmfyNcl52qSYtc2Buk0NCe6jU1sWWNB" crossorigin="anonymous">
<link rel="icon" href="img/favicon.png">
<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/header.js" async></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>﻿
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<title> header </title>
</head>
<body id="headerBody">
	
	<div class="headerBox">
		<div class="headerClock"></div>
		
		<div class="headerLogo">
			<div>#</div>
			<div>Moon</div>
		 </div>
		 
		 <!-- 간격 맞추기용 빈 box -->
		 <div></div>
		
		<i class="fas fa-bars fa-2x headerMenuBtn"></i>
	</div>
	
   	<!-- nav menu-->
    <aside class="menuBox">
        <div class="menuBox_userBox">
            <div class="menuBox_userBox_list">
            	<a href="#.jsp"> 로그인 </a> 
            	<a href="#.jsp"> 회원가입 </a>
            	<a href="#.jsp"> 장바구니 </a>
            	<a href="#.jsp"> 마이페이지 </a>
            </div>
          	<div class="menuBox_about">
          		<h3>ABOUT</h3>
          		<ul class="aboutlist">
          			<li ><a href="about.jsp">ABOUT #Moon</a></li>
          			<li ><a href="allBrand.jsp">ALL Brand</a></li>
          		</ul>
          	</div>
          	<div class="menuBox_shop">
          		<h3>SHOP</h3>
         		<ul class="shoplist">
          			<li ><a href="shopGuitar.jsp">GUITAR</a></li>
          			<li ><a href="shopBass.jsp">BASS</a></li>
          			<li ><a href="shopMidi.jsp">MIDI</a></li>
          			<li ><a href="shopAlbum.jsp">ALBUM</a></li>
          		</ul>
          	</div>
          	<div class="menuBox_community">
          		<h3>COMMUNITY</h3>
          		<ul class="communitylist">
          			<li ><a href="contact.jsp">CONTACT</a></li>
          			<li ><a href="wayToCome.jsp">WAYTOCOME</a></li>
          		</ul>
          	</div>
          		<div class="menuBox_customer">
          		<h3>CUSTOMER</h3>
          	</div>
        </div>
    </aside>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<link href="${path}/resources/css/common.css" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-iKbFRxucmOHIcpWdX9NTZ5WETOPm0Goy0WmfyNcl52qSYtc2Buk0NCe6jU1sWWNB" crossorigin="anonymous">
<link rel="icon" href="img/favicon.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- js -->
<script src="${path}/resources/js/common.js" async></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>﻿
</head>


<html>
<body id="headerBody">
	
	<div class="headerBox">
		<div class="headerClock"></div>
		
		<div class="headerLogo">
			<a href="/">
				<div>#</div>
				<div>Moon</div>
		 	</a>
		 </div>
		 
		 <!-- 간격 맞추기용 빈 box -->
		 <div></div>
		
		<i class="fas fa-bars fa-2x headerMenuBtn"></i>
	</div>
	
   	<!-- nav menu-->
    <aside class="menuBox">
        <div class="menuBox_userBox">
        	<div class="menuBox_greating">
        		안녕하세요 더문 님
        	</div>
            <div class="menuBox_userBox_list">
            	<a href="/login"> 로그인 </a> 
            	<a href="#.jsp"> 회원가입 </a>
            	<a href="#.jsp"> 장바구니 </a>
            	<a href="#.jsp"> 마이페이지 </a>
            </div>
          	<div class="menuBox_about dropBtn">
          		<h3>ABOUT</h3>
          		<ul class="aboutlist dropList">
          			<li ><a href="/about"> ABOUT #Moon </a></li>
          			<li ><a href="/allBrand">ALL Brand</a></li>
          		</ul>
          	</div>
          	<div class="menuBox_shop dropBtn">
          		<h3>SHOP</h3>
         		<ul class="shoplist dropList">
          			<li ><a href="shopGuitar.jsp">GUITAR</a></li>
          			<li ><a href="shopBass.jsp">BASS</a></li>
          			<li ><a href="shopMidi.jsp">MIDI</a></li>
          			<li ><a href="shopAlbum.jsp">ALBUM</a></li>
          		</ul>
          	</div>
          	<div class="menuBox_community dropBtn">
          		<h3>COMMUNITY</h3>
          		<ul class="communitylist dropList">
          			<li ><a href="contact.jsp">CONTACT</a></li>
          			<li ><a href="wayToCome.jsp">WAYTOCOME</a></li>
          		</ul>
          	</div>
          		<div class="menuBox_customer">
	          		<h3>CUSTOMER</h3>
	          		<ul>
	          			<li>1566-2324</li>
	          			<li>상담시간 월~금 AM 10:00~PM 06:00</li>
	          			<li>점심시간 월~금 PM 13:00~PM 14:00</li>
	          			<li>토요일 일요일 공휴일 휴무</li>
	          		</ul>
          		</div>
        </div>
    </aside>

</body>

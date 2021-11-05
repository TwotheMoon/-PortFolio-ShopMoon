<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page isELIgnored="false" %>
<%@ page session="true" %>

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
        		안녕하세요 <c:if test="${member != null }"><span>${member.memberName} 님</span></c:if>
        	</div>
            <div class="menuBox_userBox_list">
           		 <!-- 로그인하지 않은 상태 -->
            	<c:if test="${member == null }">
	            	<a href="/member/login"> 로그인 </a>
	            	<a href="/member/signUp"> 회원가입 </a>
            	</c:if>
            	 <!-- 로그인한 상태 -->
            	<c:if test="${member != null }">
	            	<c:if test="${member.memberAuthority == 1 }">
	            		<a href="/admin/productList">관리자 페이지</a>
		            	<a href="/member/logout"> 로그아웃 </a>
	            	</c:if>
	            	<c:if test="${member.memberAuthority == 0 }">
		            	<a href="/member/logout"> 로그아웃 </a>
		            	<a href="#"> 장바구니 </a>
		            	<a href="/member/myPage"> 마이페이지 </a>             	
	            	</c:if>
            	</c:if>
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
          			<li ><a href="/shop/guitarList">GUITAR</a></li>
          			<li ><a href="/shop/bassList">BASS</a></li>
          			<li ><a href="/shop/midiList">MIDI</a></li>
          			<li ><a href="/shop/albumList">ALBUM</a></li>
          		</ul>
          	</div>
          	<div class="menuBox_community dropBtn">
          		<h3>COMMUNITY</h3>
          		<ul class="communitylist dropList">
          			<li ><a href="/community/contactList">CONTACT</a></li>
          			<li ><a href="/wayToCome">WAYTOCOME</a></li>
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
        
         <form id="todo-form">
         	<h1>당신만을 위한 메모장</h1>
            <input type="text" placeholder="뭐든 적어보세요!" required />
        </form>
        <div id="todo_listBox">
            <ul id="todo-list"></ul>
        </div>
        
    </aside>

<script src="${path}/resources/js/todoList.js"></script>
<script src="${path}/resources/js/common.js"></script>
</body>


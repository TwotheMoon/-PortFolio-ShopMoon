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
<link href="${path}/resources/css/home.css" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-iKbFRxucmOHIcpWdX9NTZ5WETOPm0Goy0WmfyNcl52qSYtc2Buk0NCe6jU1sWWNB" crossorigin="anonymous">
<link rel="icon" href="img/favicon.png">	
	
	<title> Home Footer </title>
</head>
<body id="footerBody">
<section class="footerSectionBox">
	<div class="footerSectionBox_infoList">
		<a href="/about">회사소개</a> |
		<a href="#">이용약관</a> |
		<a href="#">개인정보처리방침</a> |
		<a href="#">이용안내</a> |
		<a href="#">제휴문의</a>
	</div>
	<div class="footerSectionBox_middleBox">
		<div class="footerSectionBox_customer">
			<h1 class="middleBox_header">CUSTOMER CENTER</h1>
			<div> 010-1234-1234</div>
			<div class="middleBox_contents">평일 오전 10:00 ~ 오후 6:00 <br>
				 점심시간 오후 12:00 ~ 오후 1:00 <br>
				 토 / 일 / 공휴일 휴무
				 </div>
		</div>
		<div class="footerSectionBox_accountInfo">
			<h1 class="middleBox_header">ACCOUNT INFO</h1>
			<div class="middleBox_contents">
				국민 000000-00-000000 <br>
				예금주 샵문(이더문)
			</div>
		</div>
		<div class="footerSectionBox_FavoriteMenu">
			<h1 class="middleBox_header">FAVORITE MENU</h1>
			<div class="middleBox_contents">
				<a href="#">로그인 / 회원가입</a>
				<a href="#">장바구니</a>
				<a href="#">주문조회</a>
				<a href="#">마이페이지</a>
			</div>
		</div>
		<div class="footerSectionBox_exchange">
			<h1 class="middleBox_header">RETURN / EXCHANGE</h1>
			<div class="middleBox_contents">
				서울시 가상구 가상로 122-12 1층 샵문 우)12312 <br>
				자세한 교환 반품절차 안내는 1대1문의 해주세요.
			</div>
			<div class="middleBox_icons">
				<i class="fab fa-facebook-square fa-lg"></i>
				<i class="fab fa-instagram fa-lg"></i>
				<a href="http://2themoon.iptime.org/"><i class="far fa-home fa-lg"></i></a>
				<i class="fas fa-shopping-cart fa-lg"></i>
				<i class="fas fa-user fa-lg"></i>
			</div>		
		</div>
	</div>
		<div class="footerSectionBox_copyLight">
			<div>COPYRIGHT © #Moon ALL RIGHTS RESERVED. | DESIGNED By 2theMoon</div>
		</div>
</section>



<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>
</html>

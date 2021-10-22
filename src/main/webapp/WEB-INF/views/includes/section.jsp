<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<!-- css -->
<link href="${path}/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- js -->
<script src="${path}/resources/js/section.js" async></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- bsSlide 초기화 -->
<script> 
$(document).ready(function(){
    $('.slider').bxSlider();
  });
</script>

	<title> Home - Section </title>
</head>
<body id="sectionBody">
	
	<section class="carouselBox">
		<ul class="slider">
			<li><img src="${path}/resources/img/carouselImg02.jpg"></li>
			<li><img src="${path}/resources/img/carouselImg01.jpg"></li>
			<li><img src="${path}/resources/img/carouselImg03.jpg"></li>
			<li><img src="${path}/resources/img/carouselImg04.jpg"></li>
		</ul>
	</section>
	<section class="contentsBox">
		<h2> 상품 영역 </h2>
	</section>
	<section class="boardBox">
		<h2> 게시판 영역 </h2>
		<h2> 게시판 영역 </h2>
		<h2> 게시판 영역 </h2>
		<h2> 게시판 영역 </h2>
		<h2> 게시판 영역 </h2>
		<h2> 게시판 영역 </h2>
		<h2> 게시판 영역 </h2>
		<h2> 게시판 영역 </h2>
		
	</section>


</body>
</html>

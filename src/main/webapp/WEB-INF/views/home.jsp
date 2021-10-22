<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>	
	
<body id="homeBody">
    
	<!-- css AOS 초기화 -->
	<script>
	    AOS.init();
	</script>
	<!-- bsSlide 초기화 -->
	<script> 
	$(document).ready(function(){
	    $('.slider').bxSlider();
	  });
	</script>
   
	<section class="homeBox opacityBox" >
		<section class="homeCarouselBox">
			<ul class="slider">
				<li><img src="${path}/resources/img/carousel/carouselImg02.jpg"></li>
				<li><img src="${path}/resources/img/carousel/carouselImg01.jpg"></li>
				<li><img src="${path}/resources/img/carousel/carouselImg03.jpg"></li>
				<li><img src="${path}/resources/img/carousel/carouselImg04.jpg"></li>
			</ul>
		</section>
		<!-- 상품 영역 -->
		<section class="homeContentsBox">
			<h1> 상품 영역 </h1>
			<div class="homeContentsBox_poductBox">
				<div>상품 img1</div>
				<div>상품 img2</div>
				<div>상품 img3</div>
				<div>상품 img4</div>
				<div>상품 img5</div>
				<div>상품 img6</div>
			</div>
		</section>
		
		<!-- 게시판 영역 -->
		<section class="homeBoardBox">
			<h1> 게시판 영역 </h1>
			<div class="homeBoardBox_boardBox">
				<div>자유 게시판 / 채팅</div>
				<div>문의 게시판</div>
			</div>
		</section>
	</section>
	
	<footer class="homeFooterBox" >
		<jsp:include page="includes/footer.jsp" />
	</footer>

</body>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="aboutBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    
	<!-- about.jsp 컨텐츠 -->
	<section class="aboutBox opacityBox" >
	
		<div class="aboutBox_title">
			<h1>ABOUT #Moon</h1>
		</div>
		
		<div class="aboutBox_nav">
			<a href="/about">ABOUT #Moon</a> |
			<a href="/allBrand">All Brand</a>
		</div>
		
		<div class="aboutBox_column1">
			<img data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/about/aboutImg01.jpg">
			<p data-aos="fade-up-left"  data-aos-easing="ease-in-out" data-aos-duration="1000" data-aos-delay="50">
				안녕하세요. <br>
				당신의 음악스타일을 위해 <br>
				항상 노력하는 #Moon입니다. 
			</p>
		</div>
		
		<div class="aboutBox_column2">
			<img data-aos="fade-down"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/about/aboutImg02.jpg">
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
		
		<div class="aboutBox_column3">
			<img data-aos="fade-left"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/about/aboutImg03.jpg">
			<p data-aos="fade-up-right"  data-aos-easing="ease-in-out" data-aos-duration="1000" data-aos-delay="50">
				<span>다양한 악기, 최신 아티스트 정보</span> <br><br><br>
				또 원하는 장비가 있으시다면 <br>
				언제든 문의 주세요 <br>
				저희는 고객님들과 함께 만들어갑니다. <br>
			</p>
		</div>
		
		
        <h1 class="youtubeHeader" data-aos="zoom-in"  data-aos-easing="ease-in-out">with Chillhop Music</h1>
        <div id="player" class="youtubeBox" data-aos="fade-up"  data-aos-easing="ease-in-out" data-aos-duration="1000"></div>
	</section>
	
	<footer class="aboutFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	
	
<!-- 어바웃 js -->
<script src="${path}/resources/js/about.js"></script>
</body>

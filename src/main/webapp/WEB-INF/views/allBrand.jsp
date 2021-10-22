<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>

<body id="allBrandBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    
	<!-- allBrand.jsp 컨텐츠 -->
	<section class="allBrandBox opacityBox" >
	
		<div class="allBrandBox_title">
			<h1>All Brand</h1>
		</div>
		
		<div class="allBrandBox_nav">
			<a href="/about">ABOUT #Moon</a> |
			<a href="/allBrand">All Brand</a>
		</div>
		
		<div class="allBrandBox_column1">
			<img data-aos="fade-down"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImg01.jpg">
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
		
		<div class="allBrandBox_column2">
			<div class="allBrandMiniLogo-title" data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000">Main Partners</div>
			<div class="allBrandMiniLogos" data-aos="fade-up"  data-aos-easing="ease-in-out" data-aos-duration="1000">
				<img src="${path}/resources/img/allBrand/allBrandImgSmall01.png">
				<img src="${path}/resources/img/allBrand/allBrandImgSmall02.png">
				<img src="${path}/resources/img/allBrand/allBrandImgSmall03.png">
				<img src="${path}/resources/img/allBrand/allBrandImgSmall04.png">
				<img src="${path}/resources/img/allBrand/allBrandImgSmall05.png">
				<img src="${path}/resources/img/allBrand/allBrandImgSmall06.png">
			</div>
		</div>
		
		<div class="allBrandbigLogo-title" data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000">Others</div>
		
		<div class="allBrandBox_column3">
			<img data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig01.jpg">
		</div>
		<div class="allBrandBox_column4">
			<img data-aos="fade-left"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig02.jpg">
		</div>
		<div class="allBrandBox_column5">
			<img data-aos="zoom-in"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig03.jpg">
		</div>
		<div class="allBrandBox_column6">
			<img data-aos="zoom-in"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig04.jpg">
		</div>
		<div class="allBrandBox_column7">
			<img data-aos="zoom-in"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig05.jpg">
		</div>
		<div class="allBrandBox_column8">
			<img data-aos="zoom-out"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig06.jpg">
		</div>
		<div class="allBrandBox_column9">
			<img data-aos="fade-down-right"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig07.jpg">
		</div>
		<div class="allBrandBox_column10">
			<img data-aos="fade-up-left"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/allBrand/allBrandImgBig08.jpg">
		</div>
		<div class="allBrandBox_column11">
			<div>
				제휴문의 <br>
				shopmoon@gmail.com <br> 
				Tel : 010-1234-4321
			</div>
		</div>
	</section>
	
	<footer class="allBrandFooterBox" >
		<jsp:include page="includes/footer.jsp" />
	</footer>

</body>


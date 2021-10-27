<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="contactBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    	<!-- 구글맵 api -->
    
	<!-- wayToCome.jsp 컨텐츠 -->
	<section class="contactBox opacityBox" >
	
		<div class="contactBox_title">
			<h1>Contact - 1 대 1 문의</h1>
		</div>
		
		
		<div class="contactBox_nav">
			<a href="/contact">Contact</a> |
			<a href="/wayToCome">Way To Come</a>
		</div>
		
		<div class="contactBox_board">
			<h1>문의 게시판</h1>
		</div>
		
		
	</section>
	
	<footer class="wayToComeFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

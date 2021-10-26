<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="loginBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
       	<!-- 회원가입 js -->
<script src="${path}/resources/js/login.js" async></script>
    
	<!-- login.jsp 컨텐츠 -->
	<section class="loginBox opacityBox">
		<div class="loginBox_title">
			<h1>Logout</h1>
		</div>		
	</section>
	
	<footer class="loginFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>

</body>

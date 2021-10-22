<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>

<body id="loginBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    
	
	<!-- login.jsp 컨텐츠 -->
	<section class="loginBox opacityBox">
		<div class="loginBox_title">
			<h1>Login</h1>
		</div>
		
	</section>
	
	<footer class="footerBox" >
		<jsp:include page="includes/footer.jsp" />
	</footer>

</body>

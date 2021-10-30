<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path}../includes/header.jsp" />
</header>	
	
<body id="adminMainBody">
    
	<section class="adminMainBox opacityBox" >
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<h1> 관리자 페이지 </h1>
		<a href="/admin/productEnroll"><button>상품 등록</button></a>
		
	</section>
	
	<footer class="homeFooterBox" >
		<jsp:include page="${path}../includes/footer.jsp" />
	</footer>

</body>


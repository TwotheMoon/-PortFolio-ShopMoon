<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path}../includes/header.jsp" />
</header>	
	
<body id="adminMainBody">
    
	<section class="adminMainBox opacityBox" >
		
		<div class="adminMainBox_title">
			<h1> 관리자 페이지 </h1>
		</div>
		
		<div class="adminMainBox_nav">
			<a href="/admin/adminMain">관리자 페이지</a> |
			<a href="/admin/productEnrollView">상품 등록</a> |
			<a href="/admin/productList">상품 관리</a> |
			<a href="#">회원 관리</a> |
		</div>
		
		<h1> 관리자 페이지 </h1>
	</section>
	
	<footer class="adminMainFooterBox" >
		<jsp:include page="${path}../includes/footer.jsp" />
	</footer>

 <!-- 관리자 페이지 js -->
<script src="${path}/resources/js/adminMain.js"></script>

</body>


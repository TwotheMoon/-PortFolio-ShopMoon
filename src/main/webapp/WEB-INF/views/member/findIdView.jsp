<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="findIdBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>

    
	<!-- findIdView.jsp 컨텐츠 -->
	<section class="findIdBox opacityBox">
		<div class="findIdBox_title">
			<h1>아이디 찾기</h1>
		</div>
			<div class="findIdBox_subtitle">
				<h1>회원가입떄 입력하신 이메일을 적어주세요.</h1>
			</div>
		
		
		<form class="findIdBox_form"  method="post">
			<input class="findId" name="memberEmail" placeholder="이메일" required> <br>

			<c:if test="${result == 0}">
				<div class="LoginFail">아이디를 찾을 수 없어요.</div>
			</c:if>
			<c:if test="${result == 1}">
				<div class="LoginSuccess">회원님의 아이디는 : ${memberId} 입니다.</div> 
			</c:if>				
			<button class="findIdBtn">아이디 찾기</button> 
			<button class="redirectHomeBtn">돌아가기</button> <br>
		</form>
		
	</section>
	
	<footer class="loginFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	
       	<!-- 아이디 찾기 js -->
<script src="${path}/resources/js/findId.js"></script>
</body>

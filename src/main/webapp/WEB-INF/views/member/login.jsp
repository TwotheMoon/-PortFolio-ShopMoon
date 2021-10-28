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

    
	<!-- login.jsp 컨텐츠 -->
	<section class="loginBox opacityBox">
		<div class="loginBox_title">
			<h1>Login</h1>
		</div>		
		
		<form class="loginBox_form"  method="post">
			<input class="loginId" name="memberId" placeholder="아이디" required> <br>
			<input class="loginPw" name="memberPw" type="password" placeholder="비밀번호" required> <br>
			<c:if test="${result == 0}">
				<div class="LoginFail">아이디 또는 비밀번호를 잘못 입력했어요.</div>
			</c:if>
			<c:if test="${result == -1}">
				<div class="LoginFail">탈퇴한 회원입니다.</div>
			</c:if>
			<button class="loginBtn">로그인</button> <br>

			
			<div class="snsLoginImgs">
				<img alt="네이버 로그인 Btn" src="${path}/resources/img/snsBtn/naverLoginBtn.png">
				<img alt="카카오 로그인 Btn" src="${path}/resources/img/snsBtn/kakaoLoginBtn.png">
				<img alt="구글 로그인 Btn" src="${path}/resources/img/snsBtn/googleLoginBtn.png">			
			</div>
		</form>
		
			<div class="loginBox_find">
			<a href="/member/findIdView"><button class="loginBox_findId">아이디 찾기</button></a>
				<button class="loginBox_findPw">비밀번호 찾기</button>
			</div>
			<a href="/member/signUp"><button class="loginBox_signUp">회원가입</button></a>
		
	</section>
	
	<footer class="loginFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	
       	<!-- 로그인 js -->
<script src="${path}/resources/js/login.js"></script>
</body>

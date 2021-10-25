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
		<form class="loginBox_form" action="/login" method="post">
			<input class="loginId" name="loginId" placeholder="아이디" required> <br>
			<input class="loginPw" name="loginPw" placeholder="비밀번호" required> <br>
			<button class="loginBtn" type="submit">로그인</button> <br>
			<div class="snsLoginImgs">
				<img alt="네이버 로그인 Btn" src="${path}/resources/img/snsBtn/naverLoginBtn.png">
				<img alt="카카오 로그인 Btn" src="${path}/resources/img/snsBtn/kakaoLoginBtn.png">
				<img alt="구글 로그인 Btn" src="${path}/resources/img/snsBtn/googleLoginBtn.png">			
			</div>
		</form>
		
			<div class="loginBox_find">
				<button class="loginBox_findId">아이디 찾기</button>
				<button class="loginBox_findPw">비밀번호 찾기</button>
			</div>
			<a href="/signUp"><button class="loginBox_signUp">회원가입</button></a>
		
	</section>
	
	<footer class="loginFooterBox" >
		<jsp:include page="includes/footer.jsp" />
	</footer>

</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="signUpBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
   	<!-- 회원가입 js -->
<script src="${path}/resources/js/signUp.js" async></script>
    <!-- 다음 맵 api 임포트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<!-- login.jsp 컨텐츠 -->
	<section class="signUpBox opacityBox">
		<div class="signUpBox_title">
			<h1>Sign Up</h1>
		</div>		
		<form class="signUpBox_form" method="post">
	
			<input class="signUpId" name="memberId" placeholder="아이디" > <br>
			<span class="idOverlapCheckOK">사용 가능한 아이디에요.</span> 
			<span class="idOverlapCheckNo">아이디가 이미 존재해요.</span> <br>
			
			<input type="password" class="signUpPw" name="memberPw" placeholder="비밀번호"> <br>
			
			<input type="password" class="signUpPwConfirm" placeholder="비밀번호 확인" > <br>
			
			<input class="signUpName" name="memberName" placeholder="이름" > <br>
			
			<input class="signUpPhone" name="memberPhone" placeholder="전화번호 (-없이 입력)" > <br>
			
			<input class="signUpEmail" name="memberEmail" placeholder="이메일" > <br>
    		
    		<div class="signUpAddressBox">	
   				<input class="signUpAddressBtn" type="button" value="주소검색"> <br><br>
   				<input type="text" id="postcode" placeholder="우편번호" name="memberPostNum" size="6">
   				<input type="text" id="roadAddress" placeholder="도로명주소" name="memberAddr1"> 
   				<input type="text" id="detailAddress" placeholder="상세주소" name="memberAddr2"><br><br>
     		</div>
     		
    		
     		<div>
     			<input class="signUpAddress2" type="text" id="jibunAddress" placeholder="지번주소" name="jibunAddress">
				<input type="text" id="extraAddress" placeholder="참고항목" name="extraAddress">
    		</div>
	    		
			<button class="signUpBtn" type="submit">회원가입</button> <br>
		</form>
		
			<div class="snsSignUpImgs">
				<div> SNS 빠른 회원 가입</div>
				<img alt="네이버 로그인 Btn" src="${path}/resources/img/snsBtn/naverLoginBtn.png">
				<img alt="카카오 로그인 Btn" src="${path}/resources/img/snsBtn/kakaoLoginBtn.png">
				<img alt="구글 로그인 Btn" src="${path}/resources/img/snsBtn/googleLoginBtn.png">			
			</div>
	</section>
	
	<footer class="loginFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	

</body>

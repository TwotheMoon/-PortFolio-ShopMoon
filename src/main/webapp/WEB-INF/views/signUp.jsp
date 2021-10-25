<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>

<body id="signUpBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
<script src="${path}/resources/js/signUp.js" async></script>
    <!-- 다음 맵 api 임포트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<!-- login.jsp 컨텐츠 -->
	<section class="signUpBox opacityBox">
		<div class="signUpBox_title">
			<h1>Sign Up</h1>
		</div>		
		<form class="signUpBox_form" action="/login" method="post">
	
			<input class="signUpId" name="signUpId" placeholder="아이디" > <br>
			
			<input class="signUpPw" name="signUpPw" placeholder="비밀번호"> <br>
			
			<input class="signUpPwConfirm" name="signUpPwConfirm" placeholder="비밀번호 확인" > <br>
			
			<input class="signUpName" name="signUpName" placeholder="이름" > <br>
			
			<div class="signUpPhoneBox">
				<label>휴대전화</label> <br>
				<select class="signUpPhone1" name="signUpPhone1"> 
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="01">019</option>
				</select> - 
				<input class="signUpPhone2" type="text" maxlength="4" name="signUpPhone2" size="4"> - 
				<input class="signUpPhone3" type="text" maxlength="4" name="signUpPhone3" size="4">
			</div>
			
			<div>	
    			<input class="signUpEmail1" type="text" name="signUpEmail1" placeholder="이메일">@ 				
    			<input type="text" class="selBoxDirect" name="selBoxDirect">
    			<select class="signUpEmail2" name="signUpEmail2">
    				<option value="naver.com">naver.com</option>
    				<option value="gmail.com">gmail.com</option>
    				<option value="daum.net">daum.net</option>
    				<option value="direct">직접입력</option>
    			</select>
    		</div>
    		
    		<div class="signUpAddressBox">	
   				<input class="signUpAddressBtn" type="button" value="주소검색"> <br><br>
   				<input type="text" id="postcode" placeholder="우편번호" name="postcode" size="6">
   				<input type="text" id="roadAddress" placeholder="도로명주소" name="roadAddress"> 
   				<input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress"><br><br>
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
		<jsp:include page="includes/footer.jsp" />
	</footer>
	

</body>

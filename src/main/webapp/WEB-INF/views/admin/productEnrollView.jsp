<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- 달력 위젯 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="productEnrollBody">


	<!-- login.jsp 컨텐츠 -->
	<section class="productEnrollBox opacityBox">
		<div class="productEnrollBox_title">
			<h1>상품 등록</h1>
		</div>		
		
		<div class="productEnrollBox_nav">
			<a href="/admin/productEnrollView">상품 등록</a> |
			<a href="/admin/productList">상품 관리</a> |
			<a href="#">회원 관리</a> 
		</div>
		
		
		<form class="productEnrollBox_form" method="post">
		
			<label class="productEnrollCategory_label productEnrollLabel">카테고리</label>
			<select class="productEnrollCategory" name="productCategory" >
				<option value="기타" selected>기타</option>
				<option value="베이스">베이스</option>
				<option value="미디">미디</option>
				<option value="앨범">앨범</option>
			</select>
	    		
			
			<label class="productEnrollActive_label productEnrollLabel">판매유무</label>
			<select class="productEnrollActive" name="productActive" >
				<option value="Y" selected>판매중</option>
				<option value="N">미판매</option>
			</select>
			
			<label class="productEnrollBest_label productEnrollLabel">베스트 상품 유무</label>
			<select class=productEnrollBest name="productBest" >
				<option value="Y" selected>베스트</option>
				<option value="N">일반</option>
			</select> <br>
	
			<input class="productEnrollName" name="productName" placeholder="상품 이름" > <br>
			
			<input class="productEnrollPrice" name="productPrice" placeholder="가격" > <br>
			
			<input class="productEnrollStock" name="productStock" placeholder="재고" > <br>
			
			<div class="productEnrollForm-section">
				<div class="productEnrollForm_section_title">
					<label>상품 이미지</label>
				</div>
				<div class="productEnrollForm_section_content">
					<input type="file" id="fileItem" name="uploadFile">
					<div id="uploadResult">	
						
					</div>
				</div>
			</div>
			
			<div class="procutEnrollContentsBox">
				<textarea class="productEnrollContents" name="productContents"  placeholder="상품 설명" ></textarea> <br>
			</div>
			
			<label class="productEnrollRegDate_label productEnrollLabel"> 상품 등록일 </label>
			<input name="productRegDate" class="productEnrollRegDate" autocomplete="off" readonly="readonly"> <br>
			<div class="productdEnrollBtn_Box">
				<button class="productEnrollBtn" type="submit">상품 등록</button>
				<button class="productEnroll_cansleBtn" type="button">취소</button> <br>
			</div>
		</form>
		
	</section>
	
	<footer class="loginFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	
 <!-- 상품등록 js -->
<script src="${path}/resources/js/productEnrollView.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">


/* 달력 위젯 적용  */
	/* 설정 */
const calenderConfig = {
	dateFormat: 'yy-mm-dd',
	showOn : "button",
	buttonText:"날짜 선택",
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    yearSuffix: '년',
       changeMonth: true,
       changeYear: true
}

/* 캘린더 */
$(function() {
  $( "input[name='productRegDate']" ).datepicker(calenderConfig);
});
</script>


</body>

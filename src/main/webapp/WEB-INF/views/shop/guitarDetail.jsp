<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="guitarDetailBody">
    
	<!-- contactDetail.jsp 컨텐츠 -->
	<section class="guitarDetailBox opacityBox" >
				
		<div class="guitarDetail_Box">
				<div class="guitarDetail_rigthBox">
					<div class="guitarDetail_img">
						<div id="uploadResult">
						</div>
					</div>
				</div>
				
				<div class="guitarDetail_leftBox">
					
					<div class="guitarDetail_regDateBox">
						<label class="guitarDetail_regDateLabel">입고 날짜</label>
						<fmt:formatDate value="${guitarInfo.productRegDate }" pattern="yyyy-MM-dd"></fmt:formatDate>					
					</div>
					
					<div class="guitarDetail_upDateBox">
						<label class="guitarDetail_upDateLabel">수정 날짜</label>
						<fmt:formatDate value="${guitarInfo.productUpdateDate }" pattern="yyyy-MM-dd"></fmt:formatDate>	
					</div> <br>
					
						<label class="guitarDetail_pNoLabel">상품 번호</label>
						<input class="guitarDetail_pNo" value="${guitarInfo.productNo }" readonly> 
						
						<label class="guitarDetail_pCategory_label">카테고리</label>
						<input class="guitarDetail_pCategory" value="${guitarInfo.productCategory }" readonly> <br>
				
						<label class="guitarDetail_pName_Label">상품 이름</label>
						<input class="guitarDetail_pName" value="${guitarInfo.productName }" readonly> <br>
	
						<label class="guitarDetail_pPrice_label">가격</label>
						<input class="guitarDetail_pPrice" value="${guitarInfo.productPrice }" readonly> <br>
	
						<label class="guitarDetail_pStock_label">재고</label>
						<input class="guitarDetail_pStock" value="${guitarInfo.productStock }" readonly> <br>
						
						<label class="guitarDetail_pActive_label">판매 상태</label>
						<input class="guitarDetail_pActive" value="${guitarInfo.productActive }" readonly> <br>
						
						<label class="guitarDetail_pBest_label">베스트 여부</label>
						<input class="guitarDetail_pBest" value="${guitarInfo.productBest }" readonly> <br>
				</div>
				
				<div class="guitarDetail_botBox">
					<label class="guitarDetail_pContents_Label">상품 설명</label> <br>
					<textarea class="guitarDetail_pContents" cols="150" rows="20">${guitarInfo.productContents}</textarea> <br>
					
					<div class="guitarDetail_Btns">
						<button class="guitarDetail_linkguitarListBtn">바로 구매</button>	
						<button class="guitarDetail_modifyWriteBtn">장바구니</button>				
					</div>	
				</div>	
		</div>
		    <form id="guitarDetail_moveForm" method="get">
		   	 <input type="hidden" name="productNo" value='<c:out value="${guitarInfo.productNo}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
			
		
	</section>
	
		<!-- 상품 상세 js -->
<script type="text/javascript" >
/* 이미지 정보 호출 */
let productNo = '<c:out value="${guitarInfo.productNo}"/>';
let uploadResult = $("#uploadResult");			

$.getJSON("/shop/getAttachListMain", {productNo : productNo}, function(arr){	
	
	if(arr.length === 0){
		
		let str = "";
		str += "<div id='result_card'>";
		str += "<img src='${path}/resources/img/noImg.png'>";
		str += "</div>";
		
		uploadResult.html(str);
		
		return;
	}
	
	let str = "";
	let obj = arr[0];	
	
	let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
	str += "<div id='result_card'";
	str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
	str += ">";
	str += "<img src='/display?fileName=" + fileCallPath +"'>";
	str += "</div>";		
	
	uploadResult.html(str);						
});	
</script>
<script src="${path}/resources/js/guitarDetail.js"></script>
	
	<footer class="guitarDetailFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

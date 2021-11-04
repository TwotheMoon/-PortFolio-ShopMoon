<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="bassDetailBody">
    
	<!-- contactDetail.jsp 컨텐츠 -->
	<section class="bassDetailBox opacityBox" >
				
		<div class="bassDetail_Box">
				<div class="bassDetail_rigthBox">
					<div class="bassDetail_img">
						<div id="uploadResult">
						</div>
					</div>
				</div>
				
				<div class="bassDetail_leftBox">
				
					<label class="bassDetail_pNoLabel">상품 번호</label>
					<input class="bassDetail_pNo" value="${bassInfo.productNo }" readonly> 
					
					<label class="bassDetail_pCategory_label">카테고리</label>
					<input class="bassDetail_pCategory" value="${bassInfo.productCategory }" readonly> <br>
			
					<label class="bassDetail_pName_Label">상품 이름</label>
					<input class="bassDetail_pName" value="${bassInfo.productName }" readonly> <br>

					<label class="bassDetail_pPrice_label">가격</label>
					<input class="bassDetail_pPrice" value="${bassInfo.productPrice }원" readonly> <br>

					<label class="bassDetail_pCount_label">주문수량</label>
					<input class="bassDetail_pCount" type="number" placeholder="1">
				</div>
				
				<div class="bassDetail_botBox">
					<label class="bassDetail_pContents_Label">상품 설명</label> <br>
					<textarea class="bassDetail_pContents" cols="150" rows="20" readonly>${bassInfo.productContents}</textarea> <br>
					
					<div class="bassDetail_Btns">
						<button class="bassDetail_linkguitarListBtn">바로 구매</button>	
						<button class="bassDetail_modifyWriteBtn">장바구니</button>	
						<button class="bassDetail_linkListBtn">목록으로 돌아가기</button>			
					</div>	
				</div>	
		</div>
		    <form id="bassDetail_moveForm" method="get">
		   	 <input type="hidden" name="productNo" value='<c:out value="${bassInfo.productNo}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
			
		
	</section>
	
		<!-- 상품 상세 js -->
<script type="text/javascript" >
/* 이미지 정보 호출 */
let productNo = '<c:out value="${bassInfo.productNo}"/>';
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
<script src="${path}/resources/js/bassDetail.js"></script>
	
	<footer class="bassDetailFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

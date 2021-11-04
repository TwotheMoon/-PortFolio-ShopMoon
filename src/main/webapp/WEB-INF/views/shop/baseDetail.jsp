<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="baseDetailBody">
    
	<!-- contactDetail.jsp 컨텐츠 -->
	<section class="baseDetailBox opacityBox" >
				
		<div class="baseDetail_Box">
				<div class="baseDetail_rigthBox">
					<div class="baseDetail_img">
						<div id="uploadResult">
						</div>
					</div>
				</div>
				
				<div class="baseDetail_leftBox">
				
					<label class="baseDetail_pNoLabel">상품 번호</label>
					<input class="baseDetail_pNo" value="${baseInfo.productNo }" readonly> 
					
					<label class="baseDetail_pCategory_label">카테고리</label>
					<input class="baseDetail_pCategory" value="${baseInfo.productCategory }" readonly> <br>
			
					<label class="baseDetail_pName_Label">상품 이름</label>
					<input class="baseDetail_pName" value="${baseInfo.productName }" readonly> <br>

					<label class="baseDetail_pPrice_label">가격</label>
					<input class="baseDetail_pPrice" value="${baseInfo.productPrice }원" readonly> <br>

					<label class="baseDetail_pCount_label">주문수량</label>
					<input class="baseDetail_pCount" type="number" placeholder="1">
				</div>
				
				<div class="baseDetail_botBox">
					<label class="baseDetail_pContents_Label">상품 설명</label> <br>
					<textarea class="baseDetail_pContents" cols="150" rows="20">${baseInfo.productContents}</textarea> <br>
					
					<div class="baseDetail_Btns">
						<button class="baseDetail_linkguitarListBtn">바로 구매</button>	
						<button class="baseDetail_modifyWriteBtn">장바구니</button>	
						<button class="baseDetail_linkBaseListBtn">목록으로 돌아가기</button>			
					</div>	
				</div>	
		</div>
		    <form id="baseDetail_moveForm" method="get">
		   	 <input type="hidden" name="productNo" value='<c:out value="${baseInfo.productNo}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
			
		
	</section>
	
		<!-- 상품 상세 js -->
<script type="text/javascript" >
/* 이미지 정보 호출 */
let productNo = '<c:out value="${baseInfo.productNo}"/>';
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
<script src="${path}/resources/js/baseDetail.js"></script>
	
	<footer class="baseDetailFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

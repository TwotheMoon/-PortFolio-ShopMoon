<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="productDetailBody">
    
	<!-- contactDetail.jsp 컨텐츠 -->
	<section class="productDetailBox opacityBox" >
				
		<div class="productDetail_Box">
				<div class="productDetail_rigthBox">
					<div class="productDetail_img">
						<div id="uploadResult">
						</div>
					</div>
				</div>
				
				<div class="productDetail_leftBox">
					
					<div class="productDetail_regDateBox">
						<label class="productDetail_regDateLabel">입고 날짜</label>
						<fmt:formatDate value="${productInfo.productRegDate }" pattern="yyyy-MM-dd"></fmt:formatDate>					
					</div>
					
					<div class="productDetail_upDateBox">
						<label class="productDetail_upDateLabel">수정 날짜</label>
						<fmt:formatDate value="${productInfo.productUpdateDate }" pattern="yyyy-MM-dd"></fmt:formatDate>	
					</div> <br>
					
						<label class="productDetail_pNoLabel">상품 번호</label>
						<input class="productDetail_pNo" value="${productInfo.productNo }" readonly> 
						
						<label class="productDetail_pCategory_label">카테고리</label>
						<input class="productDetail_pCategory" value="${productInfo.productCategory }" readonly> <br>
				
						<label class="productDetail_pName_Label">상품 이름</label>
						<input class="productDetail_pName" value="${productInfo.productName }" readonly> <br>
	
						<label class="productDetail_pPrice_label">가격</label>
						<input class="productDetail_pPrice" value="${productInfo.productPrice }" readonly> <br>
	
						<label class="productDetail_pStock_label">재고</label>
						<input class="productDetail_pStock" value="${productInfo.productStock }" readonly> <br>
						
						<label class="productDetail_pActive_label">판매 상태</label>
						<input class="productDetail_pActive" value="${productInfo.productActive }" readonly> <br>
						
						<label class="productDetail_pBest_label">베스트 여부</label>
						<input class="productDetail_pBest" value="${productInfo.productBest }" readonly> <br>
				</div>
				
				<div class="productDetail_botBox">
					<label class="productDetail_pContents_Label">상품 설명</label> <br>
					<textarea class="productDetail_pContents" cols="150" rows="20">${productInfo.productContents}</textarea> <br>
					
					<div class="productDetail_Btns">
						<button class="productDetail_linkProductListBtn">목록으로 돌아가기</button>	
						<button class="productDetail_modifyWriteBtn">게시글 수정</button>				
					</div>	
				</div>	
		</div>
		    <form id="productDetail_moveForm" method="get">
		   	 <input type="hidden" name="productNo" value='<c:out value="${productInfo.productNo}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
			
		
	</section>
	
		<!-- 글 등록 js -->
<script type="text/javascript" async="true">
let productNo = '<c:out value="${productInfo.productNo}"/>';
let uploadResult = $("#uploadResult");

$.getJSON("/admin/getAttachList", {productNo : productNo}, function(arr){
	
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

	let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	str += "<div id='result_card'";
	str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
	str += ">";
	str += "<img src='/display?fileName=" + fileCallPath +"'>";
	str += "</div>";	
	
	uploadResult.html(str);
});
</script>
<script src="${path}/resources/js/productDetail.js"></script>
	
	<footer class="pproductDetailFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="midiDetailBody">
    
	<!-- contactDetail.jsp 컨텐츠 -->
	<section class="midiDetailBox opacityBox" >
				
		<div class="midiDetail_Box">
				<div class="midiDetail_rigthBox">
					<div class="midiDetail_img">
						<div id="uploadResult">
						</div>
					</div>
				</div>
				
				<div class="midiDetail_leftBox">
				
					<label class="midiDetail_pNoLabel">상품 번호</label>
					<input class="midiDetail_pNo" value="${midiInfo.productNo }" readonly> 
					
					<label class="midiDetail_pCategory_label">카테고리</label>
					<input class="midiDetail_pCategory" value="${midiInfo.productCategory }" readonly> <br>
			
					<label class="midiDetail_pName_Label">상품 이름</label>
					<input class="midiDetail_pName" value="${midiInfo.productName }" readonly> <br>

					<label class="midiDetail_pPrice_label">가격</label>
					<input class="midiDetail_pPrice" value="${midiInfo.productPrice }원" readonly> <br>

					<label class="midiDetail_pCount_label">주문수량</label>
					<input class="midiDetail_pCount" type="number" placeholder="1">
				</div>
				
				<div class="midiDetail_botBox">
					<label class="midiDetail_pContents_Label">상품 설명</label> <br>
					<textarea class="midiDetail_pContents" cols="150" rows="20">${midiInfo.productContents}</textarea> <br>
					
					<div class="midiDetail_Btns">
						<button class="midiDetail_linkguitarListBtn">바로 구매</button>	
						<button class="midiDetail_modifyWriteBtn">장바구니</button>	
						<button class="midiDetail_linkGuitarListBtn">목록으로 돌아가기</button>			
					</div>	
				</div>	
		</div>
		    <form id="midiDetail_moveForm" method="get">
		   	 <input type="hidden" name="productNo" value='<c:out value="${midiInfo.productNo}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
			
		
	</section>
	
		<!-- 상품 상세 js -->
<script type="text/javascript" >
/* 이미지 정보 호출 */
let productNo = '<c:out value="${midiInfo.productNo}"/>';
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
<script src="${path}/resources/js/midiDetail.js"></script>
	
	<footer class="midiDetailFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

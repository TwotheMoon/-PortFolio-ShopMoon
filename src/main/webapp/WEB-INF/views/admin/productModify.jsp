<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="productModifyBody">
    
	<!-- contactDetail.jsp 컨텐츠 -->
	<section class="productModifyBox opacityBox" >
				
		<form class="productModify_form" action="/admin/productModify" method="post"> 
		<div class="productModify_Box">
				
				<div class="productModify_rigthBox">
					<div class="productModify_Img">
						<div id="uploadResult">
						</div>
					</div>			
				</div>
				
				<div class="productModify_leftBox">
					<div class="productModify_regDateBox">
						<label class="productModify_regDateLabel">입고 날짜</label>
						<fmt:formatDate value="${productInfo.productRegDate }" pattern="yyyy-MM-dd" ></fmt:formatDate>					
					</div>
					
					<div class="productModify_upDateBox">
						<label class="productModify_upDateLabel">수정 날짜</label>
						<fmt:formatDate value="${productInfo.productUpdateDate }" pattern="yyyy-MM-dd"></fmt:formatDate>	
					</div> <br>
					
						<label class="productModify_pNoLabel">상품 번호</label>
						<input class="productModify_pNo" value="<c:out value='${productInfo.productNo }'></c:out>" readonly> 
						
						<label class="productModify_pCategory_label">카테고리</label>
							<select class="productModify_pCategory" name="productCategory" >
								<option value="<c:out value='${productInfo.productCategory }'></c:out>" selected>${productInfo.productCategory }</option>
								<option value="기타">기타</option>
								<option value="베이스">베이스</option>
								<option value="미디">미디</option>
								<option value="앨범">앨범</option>
							</select> <br>
				
						<label class="productModify_pName_Label">상품 이름</label>
						<input class="productModify_pName" name="productName" value="<c:out value='${productInfo.productName }'></c:out>" > <br>
	
						<label class="productModify_pPrice_label">가격</label>
						<input class="productModify_pPrice" name="productPrice" value="<c:out value='${productInfo.productPrice }'></c:out>" > <br>
	
						<label class="productModify_pStock_label">재고</label>
						<input class="productModify_pStock" name="productStock" value="<c:out value='${productInfo.productStock }'></c:out>" > <br>
						
						<label class="productModify_pActive_label">판매 상태</label>
						<select class="productModify_pActive" name="productActive" >
							<option value="<c:out value='${productInfo.productActive }'></c:out>" selected>${productInfo.productActive }</option>
							<option value="Y">판매중/Y</option>
							<option value="N">미판매/N</option>
						</select> <br>
						
						<label class="productModify_pBest_label">베스트 여부</label>
						<select class="productModify_pBest" name="productBest" >
							<option value="<c:out value='${productInfo.productBest }'></c:out>" selected>${productInfo.productBest }</option>
							<option value="Y">베스트/Y</option>
							<option value="N">일반/N</option>
						</select>
				</div>
				
				<div class="productModify_form_section">
	                <div class="productModify_form_section_content">
						<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
						<div id="uploadResult">
															
						</div>									
                	</div>
                </div>
				
				<div class="productModify_botBox">
					<label class="productModify_pContents_Label">상품 설명</label> <br>
					<textarea class="productModify_pContents" name="productContents">${productInfo.productContents}</textarea> <br>
					
					<input type="hidden" name="productNo" value="${productInfo.productNo}">
					
					<div class="productModify_Btns">
						<button class="productModify_linkProductListBtn">목록으로 돌아가기</button>	
						<button class="productModify_modifyWriteBtn">수정하기</button>	
						<button class="productModify_modifyDeleteBtn">삭제하기</button>				
					</div>	
				</div>	
		</div>
		</form>
		
		    <form id="productModify_moveForm" method="get">
				<input type="hidden" name="productNo" value='<c:out value="${productInfo.productNo}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
		
	</section>
	
<script type="text/javascript">
/* 기존 이미지 출력 */
let productNo = '<c:out value="${productInfo.productNo}"/>';
let uploadResult = $("#uploadResult");

$.getJSON("/admin/getAttachListMain", {productNo : productNo}, function(arr){
	
	console.log(arr);
	
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
	str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
	str += "</div>";
	
	uploadResult.html(str);			
	
});// GetJSON
</script>
		<!-- 글 등록 js -->
<script src="${path}/resources/js/productModify.js"></script>
	
	<footer class="productModifyFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>

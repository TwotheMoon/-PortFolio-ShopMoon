<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="productListBody">
    
	<!-- productList.jsp 컨텐츠 -->
	<section class="productListBox opacityBox" >
	
		<div class="productListBox_title">
			<h1>상품 목록</h1>
		</div>
		
		<div class="productListBox_nav">
			<a href="/admin/productEnrollView">상품 등록</a> |
			<a href="/admin/productList">상품 관리</a> |
			<a href="#">회원 관리</a> 
		</div>
		
		<div class="productListBox_boardTitle">
			<h1>상품 관리</h1>		
		</div>
		
		<div class="productListBox_boardBox">
			<c:if test="${listCheck != 'empty' }">
			<table class="productList_board">
				<tr class="productList_board_header">
					<th>상품 번호</th>
					<th>상품 이미지</th>
					<th>카테고리</th>
					<th>상품 이름</th>
					<th>상품 내용</th>
					<th>가격</th>
					<th>재고</th>
					<th>판매여부</th>
					<th>베스트여부</th>
					<th>입고 날짜</th>
					<th>수정 날짜</th>
				</tr>
				<c:forEach items="${list}" var="list">
				<tr class="productList_board_contents">
					<td>
						<a class="productList" href='<c:out value="${list.productNo}"/>'>
							<c:out value="${list.productNo}"></c:out>
						</a>
					</td>
					<td>
						<div class="productList_image_wrap" data-id="${list.imageList[0].productNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
							<img>
						</div>
					</td>
					<td><c:out value="[${list.productCategory}]"></c:out></td> 
					<td>
						<a class="productList" href='<c:out value="${list.productNo}"/>'>
							<c:out value="${list.productName}"></c:out> 
						</a>	
					</td>
					<td>
						<a class="productList" href='<c:out value="${list.productNo}"/>'>
							<c:out value="${list.productContents}"></c:out>
						</a>
					</td>
					<td><c:out value="${list.productPrice}"></c:out></td>
					<td><c:out value="${list.productStock}"></c:out></td>
					<td><c:out value="${list.productActive}"></c:out></td>
					<td><c:out value="${list.productBest}"></c:out></td>
					<td><fmt:formatDate value="${list.productRegDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
					<td><fmt:formatDate value="${list.productUpdateDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
			<c:if test="${listCheck == 'empty' }">
				<div class="productListBoard_empty">
					검색 결과가 없어요.
				</div>
			</c:if>
			
			
			<!-- 페이지 이동 인터페이스 -->
			<div class="productList_pageMaker_box">
				<ul class="productList_pageMaker">
				
					 <c:if test="${pageMaker.prev}">
		            	<li class="pageMakerBtn productListPrev">
		            		<a href="${pageMaker.pageStart - 1}">이전</a>
		            	</li>
		             </c:if>
		                	
		              	<!-- 페이지 번호 -->
		             <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
		              	<li class="pageMakerBtn ${pageMaker.cri.pageNum == num ? "active":""}">
		              		<a href="${num}">${num}</a>
		              	</li>
		             </c:forEach>
		              	
		               	<!-- 다음 버튼 -->
		             <c:if test="${pageMaker.next}">
		               	<li class="pageMakerBtn productListNext">
		             		<a href="${pageMaker.pageEnd + 1 }">다음</a>
		               	</li>
	             	 </c:if>
            	</ul>
             </div>
             
            <form id="productList_moveForm" action="/admin/productList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
			
            <!-- 검색 영역 -->
                <div class="productListSearch_box">
                	<form id="productListSearchForm" action="/admin/productList" method="get">
                		<div class="productListSearch_input">
                			<select name="type" class="productListSearch_select">
								<option value="P">상품이름</option>
								<option value="T">카테고리</option>
								<option value="C">상품내용</option>
							</select>
                			<input class="contactListSearch_text" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                			<button class='btn productListSearchBtn'>검 색</button>
                		</div>
                	</form>
						<button class="productListBox_board_writeBtn">상품 등록</button>
                </div>  
		</div>

	</section>
	
	<footer class="productListFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	
<script type="text/javascript">
//이미지 리스트 출력
$(".productList_image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
			
		if(bobj.data("path")){
	
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			console.log("이미지 경로 : " + uploadPath);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
	
		} else {
			
			$(this).find("img").attr('src', '${path}/resources/img/noImgSmall.png');
			
		}
	});
</script>
	<!-- 글 목록, 페이징 js -->
<script src="${path}/resources/js/productList.js"></script>

</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="guitarListBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>

    
	<!-- guitarListList.jsp 컨텐츠 -->
	<section class="guitarListBox opacityBox" >
	
		<div class="guitarListBox_title">
			<h1>#Moon - GUITAR</h1>
		</div>
		
		<div class="guitarListBox_nav">
			<a href="/shop/guitarList">Guitar</a> |
			<a href="/shop/bassList">Bass</a> |
			<a href="/shop/midiList">Midi</a> |
			<a href="/shop/albumList">Album</a>
		</div>
		
		<div class="guitarListBox_section">
			<c:if test="${listCheck != 'empty' }">
				<c:forEach items="${list}" var="list">
					<div class="guitarListBox_contents">
					
						<div class="guitarList_image_wrap" data-id="${list.imageList[0].productNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
							<a class="guitarListToDetail" href='<c:out value="${list.productNo}"/>'>
								<img class="guitarListBox_imgBox_img">
							</a>
						</div> <br>
						
						<div class="guitarListName">
							<a class="guitarListToDetail" href='<c:out value="${list.productNo}"/>'>
								<c:out value="${list.productName}"></c:out> 
							</a>
						</div>
						<div class="guitarListPrice">
							<c:out value="${list.productPrice}원"></c:out>						
						</div>
						
						
					</div>
				</c:forEach> <br>
			</c:if>
		</div>
			 
			<c:if test="${listCheck == 'empty' }">
				<div class="productListBoard_empty">
					검색 결과가 없어요.
				</div>
			</c:if>
			
				
			<!-- 페이지 이동 인터페이스 -->
			<div class="guitarList_pageMaker_box">
				<ul class="guitarList_pageMaker">
				
					 <c:if test="${pageMaker.prev}">
		            	<li class="pageMakerBtn guitarListPrev">
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
		               	<li class="pageMakerBtn guitarListNext">
		             		<a href="${pageMaker.pageEnd + 1 }">다음</a>
		               	</li>
	             	 </c:if>
            	</ul>
             </div>
             
            <form id="guitarList_moveForm" action="/shop/guitarList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
			
            <!-- 검색 영역 -->
                <div class="guitarListSearch_box">
                	<form id="guitarListSearchForm" action="/shop/guitarList" method="get">
                		<div class="guitarListSearch_input">
                			<select name="type" class="guitarListSearch_select">
								<option value="P">상품이름</option>
								<option value="C">상품내용</option>
							</select>
                			<input class="guitarListSearch_text" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                			<button class='btn guitarListSearchBtn'>검 색</button>
                		</div>
                	</form>
                </div>  
	
		
	</section>

<footer class="guitarListFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
</footer>

<script type="text/javascript">
//이미지 리스트 출력
$(".guitarList_image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
			
		if(bobj.data("path")){
	
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			const fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
			
			console.log("이미지 경로 : " + uploadPath);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
	
	  	} else {
			
			$(this).find("img").attr('src', '${path}/resources/img/noImgSmall.png');
			
		} 
	});
</script>
	<!-- 글 목록, 페이징 js -->
<script src="${path}/resources/js/guitarList.js"></script>

</body>

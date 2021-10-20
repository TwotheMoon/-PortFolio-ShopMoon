<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- jsp 캐시 사용 안함 설정 -->
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>

<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
	<title>Home</title>
</head>
<body id="footerBody">
<h1> footer 영역</h1>



<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>
</html>

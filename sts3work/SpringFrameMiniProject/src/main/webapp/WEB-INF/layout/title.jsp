<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
	<a href="${root }/">
		<img alt="" src="${root }/image/jquery_img.jpg" style="width: 100px; height: 100px;">
	</a>
	
	<span>
		<c:if test="${sessionScope.loginok==null }">
			<button type="button" class="btn btn-success"
			onclick="location.href='${root}/login/form'">Login</button>
		</c:if>
		
		<c:if test="${sessionScope.loginok!=null }">
			<b>${sessionScope.myid }님이 로그인중입니다</b>
			<button type="button" class="btn btn-danger"
			onclick="location.href='${root}/login/logoutprocess'">Logout</button>
		</c:if>
	</span>		
</body>
</html>
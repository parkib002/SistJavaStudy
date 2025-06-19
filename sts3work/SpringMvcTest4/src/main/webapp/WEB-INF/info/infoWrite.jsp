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
<body>
<h2>입력 정보</h2>
<div style="color: ${infoDto.color}">
이름: ${infoDto.name }<br>
취미: <c:if test="${empty infoDto.hobby }">없음</c:if>
	 <c:if test="${!empty infoDto.hobby }">
	  <c:forEach var="h" items="${infoDto.hobby }">
        [${h }]
     </c:forEach>
	 </c:if>
	 
	 <br>
언어: ${infoDto.lang }
</div>
</body>
</html>
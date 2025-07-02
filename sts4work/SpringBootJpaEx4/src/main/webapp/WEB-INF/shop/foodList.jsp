<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
	<button type="button" onclick="location.href='addForm'"
				class="btn btn-outline-success" 
				style="margin-left: 350px; margin-bottom: 25px; margin-top: 50px;">추가</button>
	<c:if test="${count==0 }">
	<h1 class="alert alert-info">등록된 음식 정보가 없습니다</h1>
	</c:if>
	
	<c:if test="${count!=0 }">
	<table class="table table-bordered" style="width: 800px;">
		<caption align="top"><b>음식 정보</b></caption>
		
		<tr class="table-warning" align="center" valign="middle">
			<th width="80">번호</th>
			<th width="180">음식명</th>
			<th width="120">음식가격</th>
			<th width="150">음식사진</th>
			<th width="180">입고날짜</th>
			<th width="250">수정/삭제</th>
		</tr>
	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center" valign="middle">
			<td>${i.count }</td>
			<td>${dto.foodname}</td>
			<td>
				<fmt:formatNumber value="${dto.foodprice }" type="currency"/>
			</td>
			<td>
				<img alt="" src="/Food/${dto.foodphoto }" style="width: 100px; height: 100px;">
			</td>
			<td>${dto.ipgoday }</td>
			<td>
				<button type="button" onclick="location.href='updateform?num=${dto.num}'"
				class="btn btn-outline-info">수정</button>
				<button type="button" onclick="location.href='deleteform?num=${dto.num}'"
				class="btn btn-outline-danger">삭제</button>
			</td>
		</tr>
	</c:forEach>
	</c:if>	
	</table>
</body>
</html>
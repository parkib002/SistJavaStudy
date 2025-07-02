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
	<h3 class="alert alert-success">총 ${count }개의 자동차 정보가 있습니다</h3>
	<br>
	<button type="button" onclick="location.href='carform'"
				class="btn btn-outline-success" 
				style="margin-left: 350px; margin-bottom: 25px;">추가</button>
	<table class="table table-bordered" style="width: 800px;">
		<tr class="table-warning" align="center">
			<th width="80">번호</th>
			<th width="180">자동차명</th>
			<th width="120">색상</th>
			<th width="150">가격</th>
			<th width="180">구입일</th>
			<th width="180">등록일</th>
			<th width="250">수정/삭제</th>
		</tr>
		
	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${i.count }</td>
			<td>${dto.carname }</td>
			<td style="background-color: ${dto.carcolor}"></td>
			<td>
				<fmt:formatNumber value="${dto.carprice }" type="currency"/>
			</td>
			<td>${dto.guipday }</td>
			<td>
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>
			</td>
			<td>
				<button type="button" onclick="location.href='updateform?num=${dto.num}'"
				class="btn btn-outline-info">수정</button>
				<button type="button" onclick="location.href='deleteform?num=${dto.num}'"
				class="btn btn-outline-danger">삭제</button>
			</td>
		</tr>
	</c:forEach>
		
	</table>
</body>
</html>
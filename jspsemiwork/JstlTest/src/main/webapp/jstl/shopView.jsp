<%@page import="shop.data.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="shop.data.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
<%
	ShopDao dao=new ShopDao();

	List<ShopDto> list=dao.getAllSangpums();
	
	request.setAttribute("list", list);
%>
<body>
<div style="margin: 100px 100px; width: 900px;">
	<h3>Shop 전체목록</h3>
	<h6 class="alert alert-info">${list.size() }개의 상품이 입고중</h6>
	<br>
	<table class="table table-bordered">
		<tr>
			<th width="80">번호</th>
			<th width="100">카테고리</th>
			<th width="120">상품</th>
			<th width="80">가격</th>
			<th width="80">입고날짜</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td align="center">${i.count }</td>
				<td>${dto.category}</td>
				<td>
					<img alt="" src="../image/logoImg/${dto.photo }" width="50" height="50">
					<b>${dto.sangpum}</b>
				</td>
				<td align="center">
					<fmt:formatNumber value="${dto.price }" type="Currency"/>
				</td>
				<td align="center">
					<fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>
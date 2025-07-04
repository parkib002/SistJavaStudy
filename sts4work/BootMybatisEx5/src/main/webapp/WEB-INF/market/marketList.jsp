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
	<button type="button" class="btn btn-outline-info" 
	onclick="location.href='addform'">상품 추가</button>

	<c:if test="${count==0 }">
		<div class="alert alert-info">
			<b>저장된 정보가 없습니다</b>
		</div>
	</c:if>
	
	<c:if test="${count>0 }">
		<div class="alert alert-info">
			<b>총 ${count }개의 상품이 입고중입니다</b>
		</div>
		
		<table class="table table-bordered" style="width: 800px;">
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center" valign="middle">
				<td>
				<c:if test="${dto.photoname==null }">
					<img alt="" src="photo/noimage.jpeg" style="width: 150px; height: 150px;" align="left"
					hspace="20">
				</c:if>
				
				<c:if test="${dto.photoname!=null}">
					<img alt="" src="photo/${dto.photoname }" style="width: 150px; height: 150px;" align="left"
					hspace="20">
				
				</c:if>
				<h4>상품명: ${dto.sangpum }</h4>
				<h4>
					가격: <fmt:formatNumber value="${dto.price }" type="currency"/>
				</h4>
				
				
				<h4>
					입고날짜:<fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd"/>
				</h4>
				
				<button type="button" class="btn btn-outline-success btn-sm"
				onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" class="btn btn-outline-danger btn-sm"
				onclick="location.href='deleteform?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
</body>
</html>
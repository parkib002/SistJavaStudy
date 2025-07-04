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
	<h1>상품 정보 수정</h1>
	<form action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num }">
		<table class="table table border" style="width: 500px;">
			<tr>
				<th width="100px;" class="table-warning">상품명</th>
				<td>
					<input type="text" name="sangpum" class="form-control"
					style="width: 200px;" required="required" value="${dto.sangpum }">
				</td>
			</tr>
			
			<tr>
				<th width="100px;" class="table-warning">가격</th>
				<td>
					<input type="text" name="price" class="form-control"
					style="width: 200px;" required="required" value="${dto.price }">
				</td>
			</tr>
			
			<tr>
				<th width="100px;" class="table-warning">사진</th>
				<td>
					<input type="file" name="photo" class="form-control"
					style="width: 200px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-danger">수정</button>
					<button type="button" class="btn btn-outline-success"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
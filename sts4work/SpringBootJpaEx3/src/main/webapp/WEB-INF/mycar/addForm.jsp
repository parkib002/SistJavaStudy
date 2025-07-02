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
	<form action="insert" method="post">
		<table class="table table-bordered" style="width: 500px;">
			<caption align="top"><b>자동차 정보 입력</b></caption>
			<tr>
				<th>자동차명</th>
				<td>
					<input type="text" name="carname" class="form-control"
					style="width: 100px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="carprice" class="form-control"
					style="width: 100px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th>색상</th>
				<td>
					<input type="color" name="carcolor" class="form-control"
					style="width: 100px;" value="#ffccff">
				</td>
			</tr>
			
			<tr>
				<th>구입일</th>
				<td>
					<input type="date" name="guipday" class="form-control"
					style="width: 100px;" value="2025-06-01">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>음식 정보</h1>
	<form action="foodshow" method="post">
		<table class="table table border" style="width: 500px;">
			<tr>
				<th>음식명</th>
				<td>
					<input type="text" name="fname" class="form-control"
					style="width: 200px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="fprice" class="form-control"
					style="width: 200px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th>사진</th>
				<td>
					<input type="checkbox" name="fphoto" value="1.jpg">에그샌드위치
					<input type="checkbox" name="fphoto" value="2.jpg">꼬치구이
					<input type="checkbox" name="fphoto" value="3.jpg">짬뽕
				</td>
			</tr>
			
			<tr>
				<td>
					<button type="submit" class="btn btn-danger">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
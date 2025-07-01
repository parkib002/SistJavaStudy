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
<h1>폼 데이터 dto로 읽기</h1>
	<form action="read2" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th width="100">이름</th>
				<td>
					<input type="text" name="irum" class="form-control"
					style="width: 100px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th width="100">주소</th>
				<td>
					<input type="text" name="juso" class="form-control"
					style="width: 150px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th width="100">핸드폰번호</th>
				<td>
					<input type="text" name="hp" class="form-control"
					style="width: 160px;" required="required">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-danger">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
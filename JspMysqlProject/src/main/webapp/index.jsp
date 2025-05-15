<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<div style="margin: 100px 200px;">
	<button type="button" class="btn btn-info"
	onclick="location.href='hoewon/addForm.jsp'"
	style="width: 200px;">회원폼</button><br><br>
	<button type="button" class="btn btn-info"
	onclick="location.href='hoewon/hoewonList.jsp'"
	style="width: 200px;">회원 리스트</button><br><br>
	<button type="button" class="btn btn-info"
	onclick="location.href='guest/guestList.jsp'"
	style="width: 200px;">회원 방명록</button>
</div>
</body>
</html>
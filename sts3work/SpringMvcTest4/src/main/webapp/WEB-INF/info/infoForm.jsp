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
<h2>입력창</h2>
<form action="result" method="post">
이름: <input type="text" name="name"><br>
색상: <input type="color" name="color"><br>
취미: <input type="checkbox" name="hobby"  value="운동">운동
	 <input type="checkbox" name="hobby"  value="영화">영화
	 <input type="checkbox" name="hobby"  value="독서">독서
	 <input type="checkbox" name="hobby"  value="노래">노래
	 <input type="checkbox" name="hobby"  value="게임">게임<br>
it언어: <select name="lang">
	<option>java</option>
	<option>spring</option>
	<option>mysql</option>
	<option>orcle</option>
	<option>javascript</option>
</select><br>
<button type="submit">전송</button>
</form>
</body>
</html>
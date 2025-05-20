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
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
%>
<div style="margin: 200px 200px;">
<img alt="" src="../image/avata/b7.png">
<h1><%=id%>님의 회원가입이 정상적으로 완료되었습니다.</h1>
<br><br>
<button type="button" class="btn btn-success"
onclick="location.href='./index.jsp?main=login/loginMain.jsp'">로그인</button>
<button type="button" class="btn btn-success" onclick="location.href='index.jsp'">메인</button>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그인에 대한 세션값 삭제
	session.removeAttribute("loginok");
	//메인으로 이동
	response.sendRedirect("loginMain.jsp");
%>
</body>
</html>
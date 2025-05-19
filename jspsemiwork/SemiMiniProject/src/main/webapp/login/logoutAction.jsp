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
	//loginok세션제거
	session.removeAttribute("loginok");
	
	//loginmain으로 이동
	response.sendRedirect("../index.jsp?main=login/loginMain.jsp");
%>
</body>
</html>
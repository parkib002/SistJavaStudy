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
	String loginok=(String)session.getAttribute("loginok");

	if(loginok==null || loginok.equals("")) //로그아웃상태
	{%>
		<jsp:include page="loginForm.jsp"/>		
	<%}else{%>
		<jsp:include page="logoutForm.jsp"/>
	<%}
%>
</body>
</html>
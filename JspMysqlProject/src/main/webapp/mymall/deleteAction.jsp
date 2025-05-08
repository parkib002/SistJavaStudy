<%@page import="mymall.MymallDto"%>
<%@page import="mymall.MymallDao"%>
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
	String num=request.getParameter("num");

	MymallDao dao=new MymallDao();
	
	dao.deleteMymall(num);
	
	response.sendRedirect("mallList.jsp");
%>
</body>
</html>
<%@page import="hoewon.HoewonDao"%>
<%@page import="hoewon.HoewonDto"%>
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
	request.setCharacterEncoding("utf-8");

	String mid=request.getParameter("mid");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	
	HoewonDto dto=new HoewonDto();
	
	dto.setMid(mid);
	dto.setPass(pass);
	dto.setName(name);
	dto.setHp(hp);
	
	HoewonDao dao=new HoewonDao();
	
	dao.insertHoewon(dto);
	
	response.sendRedirect("addForm.jsp");
%>
</body>
</html>
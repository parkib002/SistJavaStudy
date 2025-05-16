<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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

	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pass2=request.getParameter("pass2");
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	
	MemberDto dto=new MemberDto();
	
	dto.setName(name);
	dto.setId(id);
	dto.setPass(pass2);
	dto.setEmail(email1+"@"+email2);
	
	MemberDao dao=new MemberDao();
	
	dao.insertMember(dto);
	
	response.sendRedirect("../index.jsp?main=member/gaipSuccess.jsp?id="+id);
%>
</body>
</html>
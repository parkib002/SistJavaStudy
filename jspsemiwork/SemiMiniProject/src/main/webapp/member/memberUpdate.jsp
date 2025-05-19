<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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

	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	
	MemberDto dto=new MemberDto();
	
	dto.setName(name);
	dto.setEmail(email);
	dto.setNum(num);
	
	MemberDao dao=new MemberDao();
	dao.updateData(dto);
%>
<script type="text/javascript">
 	location.href="../index.jsp?main=member/myPage.jsp";
</script>
</body>
</html>
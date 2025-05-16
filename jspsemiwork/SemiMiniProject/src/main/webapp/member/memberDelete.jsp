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
<!-- 관리자가 회원 강퇴처리하는 페이지 관리자이므로 비번 필요없음 
삭제 후 회원목록으로 이동 -->
<%
	String num=request.getParameter("num");

	MemberDao dao=new MemberDao();
	
	dao.deleteMember(num);
	
	response.sendRedirect("../index.jsp?main=/member/memberList.jsp");
%>
</body>
</html>
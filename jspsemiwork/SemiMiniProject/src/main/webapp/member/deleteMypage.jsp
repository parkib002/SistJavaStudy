<%@page import="data.dao.MemberDao"%>
<%@page import="java.lang.reflect.Member"%>
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
	String root=request.getContextPath();
	request.setCharacterEncoding("utf-8");

	String pass=request.getParameter("pass");
	String num=request.getParameter("num");
	
	MemberDao dao=new MemberDao();
	
	boolean flag=dao.checkPass(num, pass);
	
	if(flag){
		//dao.deleteMember(num);
	%>
		<script type="text/javascript">
		alert("삭제성공!")
		location.href='./index.jsp';
		</script>
	<% 
	}
	else{
	%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		history.back();
		</script>
	<%}
%>
</body>
</html>
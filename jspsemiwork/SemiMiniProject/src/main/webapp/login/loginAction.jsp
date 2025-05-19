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
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("savechk"); //check 안하면 null
	
	MemberDao dao=new MemberDao();
	boolean b=dao.checkIdPass(id, pass);
	
	//아이디와 비번이 맞으면 3개의 세션 저장..로그인 메인
	if(b){
		//세션저장
		session.setMaxInactiveInterval(60*60*8); //8시간, 생략시 30분
		
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		session.setAttribute("saveok", cbsave==null?null:"yes");
		
		//로그인 메인
		response.sendRedirect("../index.jsp?main=login/loginMain.jsp");
	}else{%>
		
		<script type="text/javascript">
		alert("아이디나 비밀번호가 맞지 않습니다");
		history.back();
		</script>
	<%}
%>
</body>
</html>
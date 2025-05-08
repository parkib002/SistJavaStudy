<%@page import="login.LoginDao"%>
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
	String savechk=request.getParameter("savechk");
	
	//아이디와 비번이 맞는지 확인
	LoginDao dao=new LoginDao();
	boolean flag=dao.isLogin(id, pass);
	
	//맞으면 세션 저장 후 로그인 메인으로 이동
	if(flag)
	{
		//로그인 중인지 알 수 있는 세션 저장
		session.setAttribute("loginok", "yes");
		//아이디와 체크값 저장
		session.setAttribute("idok", id);
		//체크하면 값으로 on, 체크안하면 null값 저장
		session.setAttribute("saveok", savechk);
		
		//세션유지시간
		session.setMaxInactiveInterval(60*60*8); //8시간 유지
		//로그인 메인으로 이동
		response.sendRedirect("loginMain.jsp");
	}else{%>
		<script type="text/javascript">
		 alert("아이디와 비밀번호가 맞지 않습니다");
		 history.back();
		</script>
	<%}
%>
</body>
</html>
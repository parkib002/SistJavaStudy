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

	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	MemberDao dao=new MemberDao();
	
	int check=dao.getLogin(id, pass);
	
	if(check==1){%>
		<script type="text/javascript">
		alert("로그인 성공!!")
		</script>
		<%
		response.sendRedirect("../index.jsp?id="+id);
	}else if(check==2){%>
		<script type="text/javascript">
		alert("비밀번호가 틀렸습니다");
		history.back();
		</script>
		<%}
	else
	{ %>
		<script type="text/javascript">
		alert("가입되지 않은 아이디입니다");
		history.back();
		</script>
		<%
		}
		%>
	
</body>
</html>
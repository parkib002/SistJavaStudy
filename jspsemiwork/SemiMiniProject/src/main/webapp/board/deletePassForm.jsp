<%@page import="data.dao.BoardDao"%>
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
	String pass=request.getParameter("pass");
	
	BoardDao dao=new BoardDao();
	
	//boolean flag=dao.isCheckPass(num, pass);
	
	//if(flag){
		
		dao.deleteBoard(num);
		//response.sendRedirect("../indext.jsp?main=board/boardList.jsp");
	//}else{%>
<!-- 		// alert("비밀번호가 맞지 않습니다"); 
		// history.back();
		</script>    -->
		
		<script type="text/javascript">
		location.href="./index.jsp?main=board/boardList.jsp";
		</script>
	<%
%>
</body>
</html>
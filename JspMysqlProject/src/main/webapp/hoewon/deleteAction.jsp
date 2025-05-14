<%@page import="hoewon.HoewonDao"%>
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

	HoewonDao dao=new HoewonDao();
	
	boolean check=dao.isPassCheck(num, pass);
	
	if(check){
		dao.deleteHoewon(num);
		%>
		<script type="text/javascript">
		alert("삭제가 완료되었습니다")
		location.href='hoewonList.jsp';
		</script>	
	<%}else{%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다");
		history.back();
		</script>
	<%
	}
	
%>
</body>
</html>
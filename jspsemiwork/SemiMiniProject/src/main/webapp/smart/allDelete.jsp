<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//nums읽는다
	String nums=request.getParameter("nums");
	//System.out.println(nums);
	//,로 분리해서 배열로 담기
	String [] num=nums.split(",");
	
	SmartDao dao=new SmartDao();
	
	//그 개수만큼 delete
	for(String n:num)
	{
		dao.deleteSmart(n);
	}
%>
</head>
<body>
<script type="text/javascript">
	location.href="./index.jsp?main=smart/selList.jsp";
</script>
</body>
</html>



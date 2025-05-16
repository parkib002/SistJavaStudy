<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
div.layout{
	border: 0px solid gray;
	position: absolute;
}

div.title{
	left: 900px;
}

div.menu{
	width: 100%;
	height: 80px;
	top: 100px;
	text-align: center;
	font-family: 'Black Han Sans';
	font-size: 20pt;
	line-height: 80px;
}	

div.sideInfo{
	width: 200px;
	height: 200px;
	line-height: 10px;
	font-family: 'Black Han Sans';
	font-size: 10pt;
	top: 300px;
	padding: 20px 10px;
	border: 5px solid blue;
	border-radius: 30px;
	position: fixed;
}

div.main{
	width: 1200px;
	height: 1000px;
	font-size: 13px;
	font-family: 'Black Han Sans';
	left: 350px;
	top: 300px;
	border: 0px solid gray;
}

.main img{
	width: 200px;
	heigt: 500px;
	margin: 15px 15px;
}

a, a:hover{
 	color: black;
 	text-decoration: none;
}
</style>
</head>
<%
	String mainPage="layout/main.jsp"; //기본 페이지	
	
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");
	}
%>
<body>
<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>

<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>

<div class="layout sideInfo">
	<jsp:include page="layout/sideInfo.jsp"/>
</div>

<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>

</body>
</html>
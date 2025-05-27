<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
</head>
<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();
	
	//로그인 세션
	String loginok=(String)session.getAttribute("loginok");
	
	//id
	String myid=(String)session.getAttribute("myid");
	//dao,id==>name
	MemberDao dao=new MemberDao();
	
	MemberDto dto=dao.getIdData(myid);
	
	//shopdao
	ShopDao sdao=new ShopDao();
	//카트 개수
	int cartSize=sdao.getCartList(myid).size();
%>
<script type="text/javascript">
	$(function(){
	$(".mypage").click(function(){
		
		location.href="index.jsp?main=shop/myCart.jsp";
	})
	})
		
</script>
<body>
	<a href="<%=root%>">
		<img alt="" src="./image2/img/jquery_img.jpg" style="height: 100px; width: 100px;'">
	</a>
	<div style="float: right; padding: 50px;">
	<%
	if(loginok==null){%>
		
		<button type="button" class="btn btn-success"
		style="width: 100px;" onclick="location.href='./index.jsp?main=login/loginMain.jsp'">Login</button>
	<%}else{%>
		<b><%=dto.getName() %>님 로그인중</b>
		<button type="button" class="btn btn-danger"
		style="width: 100px;" onclick="location.href='./index.jsp?main=login/logoutAction.jsp'">Logout</button>
		<i class="bi bi-cart mypage"></i>
	<%}
	%>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();
%>
<body>
	<a href="<%=root%>">메인(홈)</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">로그인</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">회원가입</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">방명록</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">Q&A</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">고객게시판</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">Shop</a>&nbsp;&nbsp;&nbsp;
</body>
</html>-->
<%
	String id=request.getParameter("id");
%>
<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title></title>
	<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/font-awesom.css">
	<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/menu.css">
    
	<script type="text/javascript" src="../menu/js/jquery.js"></script>
	<script type="text/javascript" src="../menu/js/function.js"></script>

</head>
<body>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="#"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%=root%>">Home</a></li>
					<li class="parent">
						<a href="#">Member</a>
						<ul class="sub-menu">
							<li><a href="index.jsp?main=member/memberList.jsp"><i class="icon-wrench"></i> 회원목록</a></li>
							<li><a href="index.jsp?main=member/memberForm.jsp"><i class="icon-credit-card"></i> 회원가입</a></li>
							<li><a href="index.jsp?main=login/loginForm.jsp"><i class="icon-gift"></i><%=id==null?"로그인":"로그아웃" %></a></li>
							<li><a href="index.jsp?main=member/myPage.jsp"><i class="icon-wrench"></i> 마이페이지</a></li>
							</li>
						</ul>
					</li>
					<li><a href="<%=root%>/guestform.jsp">방문인사</a></li>
					<li class="parent">
						<a href="#">게시판</a>
						<ul class="sub-menu">
							<li><a href="#">Q&A</a></li>
							<li><a href="<%=root%>/board/boardList.jsp">고객게시판</a></li>
							<li><a href="#">Smart게시판</a></li>
						</ul>
					</li>
					<li><a href="<%=root%>/shop/shopList.jsp">Shop</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body></html>
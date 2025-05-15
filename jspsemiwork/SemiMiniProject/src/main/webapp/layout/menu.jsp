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
					<li class="current-menu-item"><a href="#">Home</a></li>
					<li class="parent">
						<a href="#">Features</a>
						<ul class="sub-menu">
							<li><a href="#"><i class="icon-wrench"></i> Elements</a></li>
							<li><a href="#"><i class="icon-credit-card"></i>  Pricing Tables</a></li>
							<li><a href="#"><i class="icon-gift"></i> Icons</a></li>
							<li>
								<a class="parent" href="#"><i class="icon-file-alt"></i> Pages</a>
								<ul class="sub-menu">
									<li><a href="#">Full Width</a></li>
									<li><a href="#">Left Sidebar</a></li>
									<li><a href="#">Right Sidebar</a></li>
									<li><a href="#">Double Sidebar</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="#">Portfolio</a></li>
					<li class="parent">
						<a href="#">Blog</a>
						<ul class="sub-menu">
							<li><a href="#">Large Image</a></li>
							<li><a href="#">Medium Image</a></li>
							<li><a href="#">Masonry</a></li>
							<li><a href="#">Double Sidebar</a></li>
							<li><a href="#">Single Post</a></li>
						</ul>
					</li>
					<li><a href="#">Contact</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body></html>
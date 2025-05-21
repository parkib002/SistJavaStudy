<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();

	//로그인에 관한 세션
	String loginok=(String)session.getAttribute("loginok");	
	
	//아이디 세션
	String myid=(String)session.getAttribute("myid");
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
							<%
								if(loginok!=null && myid.equals("admin")){%>
									
								<li><a href="index.jsp?main=member/memberList.jsp"><i class="icon-wrench"></i> 회원목록</a></li>
									
								<%}
							%>
							
							<li><a href="index.jsp?main=member/memberForm.jsp"><i class="icon-credit-card"></i> 회원가입</a></li>
							<li><a href="index.jsp?main=login/loginMain.jsp"><i class="icon-gift"></i>
							<%=loginok==null?"로그인":"로그아웃" %></a></li>
							<li><a href="index.jsp?main=member/myPage.jsp"><i class="icon-wrench"></i> 마이페이지</a></li>
							</li>
						</ul>
					</li>
					<li><a href="index.jsp?main=guest/guestList.jsp">방문인사</a></li>
					<li class="parent">
						<a href="#">게시판</a>
						<ul class="sub-menu">
							<li><a href="#">Q&A</a></li>
							<li><a href="index.jsp?main=/board/boardList.jsp">답변형 고객게시판</a></li>
							<li><a href="#">Smart게시판</a></li>
						</ul>
					</li>
					<li><a href="<%=root%>/shop/shopList.jsp">Shop</a>
						<ul class="sub-menu">
							<li><a href="#">ShopForm</a></li>
							<li><a href="#">ShoppingMall</a></li>
							<li><a href="index.jsp?main=shop/map.jsp">오시는길</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body></html>
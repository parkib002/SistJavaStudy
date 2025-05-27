<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String shopnum=request.getParameter("shopnum");

	//로그인 상태
	String loginok=(String)session.getAttribute("loginok");
	
	//로그인한 아이디
	String myid=(String)session.getAttribute("myid");
	
	//아이디에 해당하는 멤버 시퀀스
	MemberDao mdao=new MemberDao();
	
	String num=mdao.getnum(myid);
	
	//해당 상품의 데이터 가져오기
	ShopDao sdao=new ShopDao();
	
	ShopDto dto=sdao.getData(shopnum);
%>
<script type="text/javascript">
	$(function(){
		
		$("#btncart").click(function(){
		//form데이터 모든 값 가져오기
		var formdatas=$("#frm").serialize();
		//alert(formdatas)
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			data:formdatas,
			url:"shop/detailProc.jsp",
			success:function(){
				
				//alert("장바구니에 추가되었습니다");
				var a=confirm("장바구니에 저장했습니다\n장바구니로 이동하려면 [확인]을 눌러주세요.")
				
				if(a){
				location.href="index.jsp?main=shop/myCart.jsp";
				}
			}
			
			})
		})
	})
</script>
<body>
	<form id="frm">
		<!-- hidden: 장바구니 db에 넣어야할 값들 -->
		<input type="hidden" name="shopnum" value="<%=shopnum %>">
		<input type="hidden" name="num" value="<%=num %>">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<td style="width: 200px;">
					<div id="photo" align="center">
						<img alt="" src="./save/<%=dto.getPhoto() %>">
					</div>
				</td>
				<td align="center">
					<h3>카테고리: <%=dto.getCategory() %></h3>
					<h3>상품명: <%=dto.getSangpum() %></h3>
					<%
						NumberFormat nf=NumberFormat.getCurrencyInstance();
					%>
					<h3>가격: <%=nf.format(dto.getPrice()) %></h3>
					<h3>개수: </h3>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="number" min="1" max="10" value="1" name="cnt" style="margin: 10px 10px;">
					
					<div class="buttons" align="center">
						<button type="button" class="btn btn-success"
						id="btncart">장바구니</button>
						<button type="button" class="btn btn-success"
						id="btnlist">목록</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
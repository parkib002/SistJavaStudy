<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
	String id=(String)session.getAttribute("myid");
	ShopDao dao=new ShopDao();
	
	//장바구니 목록
	List<HashMap<String,String>> list=dao.getCartList(id);

	//이름
	MemberDao mdao=new MemberDao();
	String name=mdao.getname(id);
	
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<style>
	img.photo{
		width: 60px;
		height: 80px;
		border: 2px solid gray;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//전체 체크박스 선택/해제
		$("#allcheck").click(function(){
			
			var chk=$(this).is(":checked");
			
			//전체에 일괄 전달
			$(".idx").prop("checked",chk);
		})
		
		$("div.sanginfo>img").click(function(){
			
			var shopnum=$(this).attr("shopnum");
			
			//alert(shopnum)
			
			location.href="index.jsp?main=shop/detailPage.jsp?shopnum="+shopnum;
		})
		
		//선택상품삭제
		$("#btncartdel").click(function(){
			
			//체크된 개수 확인
			var cnt=$(".idx:checked").length;
			
			if(cnt==0){
				
				alert("삭제할 상품을 최소 1개 이상 선택해주세요");
				return;
			}
				
			$(".idx:checked").each(function(i,ele){
			
				var idx=$(this).attr("idx");
				
				//선택한 것 장바구니 모두 삭제
				del(idx);
			})
			
			location.reload();
			
				
		})
		
		$(".del").click(function(){
			
			var idx=$(this).attr("idx");
			
			var a=confirm("삭제하려면 [확인]을 누르세요");
			
			if(a){
				
				del(idx);
				location.reload(); //새로고침
			}
		})
		
		
	})
	
	//삭제 사용자 함수
	function del(idx){
		
		$.ajax({
			
			type:"get",
			url:"shop/deleteCart.jsp",
			dataType:"html",
			data:{"idx":idx},
			success: function(){
				
				
			}
		})
	}
</script>
<body>
<div style="margin: 100px 100px; width: 800px;">
	<h4 class="alert alert-success"><%=name %>(<%=id %>)님의 장바구니</h4>
	<table class="table table-striped">
		<tr>
			<th><input type="checkbox" id="allcheck"></th>
			<th>상품정보</th>
			<th>상품금액</th>
		</tr>
		
		<%	int tot=0;
		
			for(int i=0;i<list.size();i++)
			{
				HashMap<String,String> hash=list.get(i);
				
				//cnt
				int cnt=Integer.parseInt(hash.get("cnt"));
				//price
				int price=Integer.parseInt(hash.get("price"));
				
				tot+=price*cnt;
				%>
				
				<tr>
					<td>
						<input type="checkbox" name="idx" class="idx"
						idx="<%=hash.get("idx") %>">
					</td>
					<td>
						<div class="sanginfo">
							<img alt="" src="save/<%=hash.get("photo") %>"
							class="photo" shopnum="<%=hash.get("shopnum") %>"
							align="left" hspace="20">
							
							<h6>상품명: <%=hash.get("sangpum") %></h6>
							<h6>개수: <%=cnt %></h6>
							<h6>날짜: <%=hash.get("cartday") %></h6>
						</div>
					</td>
					<td >
						 <%=nf.format(cnt*price) %>원&nbsp;&nbsp;&nbsp;&nbsp;
						 <b><i class="bi bi-trash-fill del" style="font-size: 20px;"
						 idx="<%=hash.get("idx") %>"></i></b>
						
					</td>
				</tr>
			<%}
		%>
		
		<tr>
			<td colspan="4" align="center">
				<button type="button"
				class="btn btn-danger" id="btncartdel">선택상품삭제</button>
				
				<span style="float: right;">총 주문금액: <b><%=nf.format(tot) %></b></span>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
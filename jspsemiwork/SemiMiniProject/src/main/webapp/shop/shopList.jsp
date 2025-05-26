<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ShopDto"%>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
	img.photo{
		width: 100px;
		height: 100px;
		border: 1px solid gray;
		margin: 10px 10px;
	}
	
	td{
		font-size: 3em;
	}
</style>
</head>
<script type="text/javascript">
	$(function(){
		
		$("a.godetail").click(function(){
			
			var shopnum=$(this).attr("shopnum");
		})
	})
</script>
<%
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">전체목록</button>
    <button class="nav-link" id="nav-sang-tab" data-bs-toggle="tab" data-bs-target="#nav-sang" type="button" role="tab" aria-controls="nav-sang" aria-selected="false">상의</button>
    <button class="nav-link" id="nav-ha-tab" data-bs-toggle="tab" data-bs-target="#nav-ha" type="button" role="tab" aria-controls="nav-ha" aria-selected="false">하의</button>
    <button class="nav-link" id="nav-outer-tab" data-bs-toggle="tab" data-bs-target="#nav-outer" type="button" role="tab" aria-controls="nav-outer" aria-selected="false" disabled>Disabled</button>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
  	<table class="table table-bordered">
  		<caption align="top">전체목록</caption>
				<tr>
			<%
				for(int i=0;i<list.size();i++){
				int discount=(int)(Math.random()*21)+20;
				ShopDto dto=list.get(i); 
				%>
					<td>
						<a class="godetail" shopnum=<%=dto.getShopnum() %>
						style="cursor: pointer;">
							<img src="./save/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %>
							<br>
							<b style="color: red;">
							할인: <%=discount %>%&nbsp;&nbsp;
							</b>
							<span>
							<strike>원가: <%=dto.getPrice() %></strike>
							</span>
							<br>
							<span>
							<%
								int price=(int)(dto.getPrice()-(dto.getPrice()*(discount/100.0)));
							%>
							<b>할인가: <%=nf.format(price) %>원</b>
							</span>
						</a>
					</td>
				<%
					if((i+1)%3==0){%>
					</tr>  	
						
					<%}
				}
				
				%>
  	</table>
  </div>
  
  <div class="tab-pane fade" id="nav-sang" role="tabpanel" aria-labelledby="nav-sang-tab" tabindex="0">
  	<table class="table table-bordered">
  		<caption align="top">상의</caption>
				<tr align="center">
			<%	int num=0;
				for(int i=0;i<list.size();i++){
				int discount=(int)(Math.random()*21)+20;
				ShopDto dto=list.get(i); 
				if(dto.getCategory().equals("상의")){
					num++;%>
					<td>
						<a class="godetail" shopnum=<%=dto.getShopnum() %>
							style="cursor: pointer;">
							<img src="./save/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %>
							<br>
							<b style="color: red;">
							할인: <%=discount %>%
							</b>
							<span>
							<strike>원가: <%=dto.getPrice() %></strike>
							</span>
							<span>
							<%
								int price=(int)(dto.getPrice()-(dto.getPrice()*(discount/100.0)));
							%>
							<b>할인가: <%=nf.format(price) %>원</b>
							</span>
						</a>
					</td>
					
				<%}
					if(num%3==0){%>
						
						</tr>
						<%}
					
				}
				%>
  	</table>
  </div>
  <div class="tab-pane fade" id="nav-ha" role="tabpanel" aria-labelledby="nav-ha-tab" tabindex="0">
  	<table class="table table-bordered">
  		<caption align="top">하의</caption>
				<tr align="center">
			<%	int num2=0;
				for(int i=0;i<list.size();i++){
				int discount=(int)(Math.random()*21)+20;
				ShopDto dto=list.get(i); 
				if(dto.getCategory().equals("하의")){
				num2++;%>
					<td>
							<a class="godetail" shopnum=<%=dto.getShopnum() %>
							style="cursor: pointer;">
							<img src="./save/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %>
							<br>
							<b style="color: red;">
							할인: <%=discount %>%
							</b>
							<span>
							<strike>원가: <%=dto.getPrice() %></strike>
							</span>
							<span>
							<%
								int price=(int)(dto.getPrice()-(dto.getPrice()*(discount/100.0)));
							%>
							<b>할인가: <%=nf.format(price) %>원</b>
							</span>
						</a>
					</td>
				<%
					if(num2%3==0){%>
							</tr>
						<%}
					}
				}
				%>
  	</table>
  </div>
  <div class="tab-pane fade" id="nav-outer" role="tabpanel" aria-labelledby="nav-outer-tab" tabindex="0"></div>
</div>
</body>
</html>
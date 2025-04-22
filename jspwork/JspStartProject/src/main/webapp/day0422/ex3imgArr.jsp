<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.main_img{
	width: 120px;
	height: 160px;
	margin-left: 20px;
	}
</style>
</head>
<body>
<%
	String [] imgArr1={"1","3","4","5","6","7","10","12","13"};
	int n=0;
	
%>

<table>
	<%
		for(int i=0;i<3;i++)
		{%>
			<tr height="70">
			<%
			for(int j=0;j<3;j++)
			{%>
				<td>
					<img src="../image/연예인사진/<%=imgArr1[n]%>.jpg"
					width="150" height="150">
				</td>
			<%
			n++;
			}
			%>
			</tr>
		<%}
	%>
</table>
<% 
	int a=1;
%>
<hr>
<h2>쇼핑몰사진을 4행 5열로 출력해주세요</h2>
<table>
<%
		for(int i=0;i<4;i++)
		{%>
			<tr>
			<%
			for(int j=0;j<5;j++)
			{%>
				<td>
					<img src="../image/쇼핑몰사진/<%=a%>.jpg" class="main_img">
				</td>
			<%
			a++;
			}
			%>
			</tr>
		<%}
	%>
</table>
<%
	int m=1;
%>
<h2>만화이미지 20개를 출력해주세요01~20 5행4열</h2>
<table>
<%
		for(int i=0;i<5;i++)
		{%>
			<tr>
			<%
			for(int j=0;j<4;j++)
			{%>
				<td>
					<img src="../image/만화이미지/<%=m<10?"0"+m:m%>.png">
				</td>
			<%
			m++;
			}
			%>
			</tr>
		<%}
	%>
</table>
</body>
</html>
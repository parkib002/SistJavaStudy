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
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("s_name");
	String area=request.getParameter("cbarea");
	String date=request.getParameter("ipsaday");
	String imgSrc=request.getParameter("gift");
	String food=request.getParameter("food");
	String color=request.getParameter("color");
	String [] lang=request.getParameterValues("lang");
	
%>

<div style="background-color: <%=color %>">
이름: <%=name %><br>
근무지역:
 <%
	if(area==null)
	%>	<b>국내</b><br><%
		else %>
		<b>해외</b><br>
입사일자: <%=date %><br>
명절 선물 선택(택1): <img src=<%=imgSrc %>><br>		
가장 좋았던 점심메뉴(택1): <img src="../image/Food/<%=food %>.jpg" style="width: 100px; height: 100px"><br>
사원의 가능 IT언어(다중선택가능):
<%
	if(lang==null)
	{%>
		<b>가능한 IT언어가 없습니다</b>
	<%}
	
	else
	{
		for(int i=0;i<lang.length;i++)
		{%>
			<b>[<%=lang[i] %>]&nbsp;</b>
		<%}
		%>
			<br>
			<b>사용가능 언어는 <%=lang.length %>개 입니다</b>
		<%
	}
%>

<br>
<a href="javascript:history.back()">다시입력</a>
</div>
</body>
</html>
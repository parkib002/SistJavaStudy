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
  //세션저장
  session.setAttribute("msg", "happy");
  session.setMaxInactiveInterval(10); //10초
%>
<h2>10초안에 선택하세요!!!!</h2>
<form action="sessionAction.jsp" method="post">
	<h2>가고 싶은 여행지는?</h2>
	<input type="radio" value="미국 뉴욕" name="travel">미국 뉴욕&nbsp;
	<input type="radio" value="일본 오사카" name="travel">일본 오사카&nbsp;
	<input type="radio" value="중국 베이징" name="travel">중국 베이징&nbsp;
	<input type="radio" value="프랑스 파리" name="travel">프랑스 파리&nbsp;
	<input type="radio" value="호주 시드니" name="travel" checked="checked">호주 시드니&nbsp;
	<input type="submit" value="여행선택" class="btn btn-success">
</form>
</body>
</html>
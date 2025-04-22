<%@page import="day0422.StudentInfoDto"%>
<%@page import="java.util.Vector"%>
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
<h3>request에 Vector 저장 후 불러오기 연습</h3>
<%
	Vector<StudentInfoDto> list=new Vector<>();
	list.add(new StudentInfoDto("홍길동","서울시 강남구",95));
	list.add(new StudentInfoDto("손흥민","서울시 강서구",90));
	list.add(new StudentInfoDto("유재석","서울시 관악구",85));
	list.add(new StudentInfoDto("김민재","경기도 수원시",80));
	list.add(new StudentInfoDto("이강인","경기도 용인시",75));
	
	//데이터 Vector를 request에 저장
	request.setAttribute("list", list);
	
	//forward: url안바뀜
	//redirect: url바뀜
	//<jsp:> 액션태그
	
%>

<jsp:forward page="ex7_forward.jsp"/>
</body>
</html>
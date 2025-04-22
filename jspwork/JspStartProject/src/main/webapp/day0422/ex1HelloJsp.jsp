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
<h2>Jsp는 html5구조에 자바코드를 쓸 수 있는 서버언어</h2>
<h4>Servlet은 확장자가 java이며 자바클래스 구조이다<br>
html, css, javaScript도 사용할 수 있는 서버언어이다</h4>
<hr>
<!-- 주석1. html기본주석..소스보기에서는 보인다 -->
<%-- jsp주석: 소스보기에서도 안보인다 --%>

<%!
	//선언문
	//변수나 메서드 등록..위치 상관없이 쓰고자 할 때
%>

<%
	//이곳의 변수를 html영역에서 사용하려면 선언한 곳보다 아래에서 사용하면 된다	
	//자바코드 쓰려면 scriptlet 영역 표시 후 코딩
	
	int age=22;
	String name="홍길동";
	String hp="010-111-2222";
	String addr="서울시 강남구";
	
	//내장객체 out 출력가능하지만 쓸일은 별로 없을듯..
	out.print("내 이름은 "+name+"이고 나이는 "+age+"세 입니다");
%>

<h4>문자열이나 변수 출력은 표현식을 이용해서 출력한다</h4>
<b>이름: <%=name %><br>
나이:<%=age %>세<br>
전화번호:<%=hp %><br>
주소:<%=addr %></b>

</body>
</html>
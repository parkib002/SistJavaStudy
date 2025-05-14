<%@page import="hoewon.HoewonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//mid, pass, remember
	String id=request.getParameter("mid");
	String pass=request.getParameter("pass");
	String saveid=request.getParameter("remember"); //체크안하면 null
	
	//dao의 로그인 호출
	//1일 경우 세션 저장 후 메인으로 가기
	//2일 경우 '비밀번호가 맞지 않습니다' 이전 페이지로
	//3일 경우 '가입되지 않은 아이디이빈다' 이전 페이지로
	HoewonDao dao=new HoewonDao();
	
	int idx=dao.getLogin(id, pass);
	
	if(idx==1)
	{
		//session에 저장
		session.setAttribute("loginok", "yes");
		session.setAttribute("mid", id);
		session.setAttribute("saveid", saveid==null?"no":"yes");
		
		session.setMaxInactiveInterval(60*60*8); //8시간 유지
		
		response.sendRedirect("loginMain.jsp");
	}else if(idx==2){%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			history.back();
		</script>
	<%}else if(idx==3){%>
		<script type="text/javascript">
			alert("가입되지 않은 회원입니다");
			history.back();
		</script>
	<%}
%>
</body>
</html>
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
<%
	//세션에 저장된 아이디
	String id=(String)session.getAttribute("mid");
	//세션에 저장된 아이디 저장 체크값
	String saveid=(String)session.getAttribute("saveid");
	//아이디 저장을 체크했을 경우 true, 안하면 false
	boolean b;
	
	if(saveid==null || saveid.equals("no"))
		b=false;
	else
		b=true;
%>
<body>
<div class="container mt-3">
  <h2>Login</h2>
  <form action="loginProc.jsp" method="post">
    <div class="mb-3 mt-3">
      <label for="mid">아이디:</label>
      <input type="text" class="form-control" id="mid" placeholder="Id" name="mid"
      style="max-width: 200px;" value="<%=b?id:""%>">
    </div>
    <div class="mb-3">
      <label for="pass">비밀번호:</label>
      <input type="password" class="form-control" id="pass" placeholder="Password" name="pass"
      style="max-width: 200px;">
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"
        <%=b?"checked":"" %>> 아이디 저장하기
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Login</button>
  </form>
</div>
</body>
</html>
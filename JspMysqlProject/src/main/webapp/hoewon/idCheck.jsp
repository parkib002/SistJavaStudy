<%@page import="hoewon.HoewonDao"%>
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
	String key=request.getParameter("key"); //처음 호출했을 때 null
	
	if(key==null){%>
		
		<!-- null일 경우 폼을 나타내고 else에서는 중복처리 해줄 예정 -->
		<div style="margin: 10px 30px;">
			<form action="idCheck.jsp" method="post">
				<b>아이디를 입력해 주세요</b><br>
				<input type="text" name="mid" class="form-control"
				style="width: 130px;" required="required">
				<input type="hidden" name="key" value="yes">
				<button type="submit" class="btn btn-danger"
				style="margin-left: 10px;">중복체크</button>
			</form>
		</div>
	<%}else{
		
		//action처리
		String mid=request.getParameter("mid");
		//dao선언 후 아이디가 db에 존재하는지 확인
		HoewonDao dao=new HoewonDao();
		
		boolean b=dao.isIdCheck(mid);
		
		if(b){
			//존재하는 경우
			%>
			<div style="margin: 10px 30px;">
				<h5><%=mid %>는 이미 가입된 아이디입니다</h5>
				<img src="../image/avata/b2.png" width="60" align="left">
				<button type="button" class="btn btn-danger"
				onclick="location.href='idCheck.jsp'">다시입력</button>
			</div>
		<%}else{
			//존재하지 않는 경우
			%>
			<div style="margin: 10px 30px;">
				<h5><%=mid %>는 사용 가능한 아이디 입니다</h5>
				<img src="../image/avata/b4.png" width="60" align="left">
				<button type="button" class="btn btn-danger"
				onclick="saveId('<%=mid%>')">적용하기</button>
			</div>
		<%}
	}
%>

<script type="text/javascript">
	function saveId(id){
		//alert(id);
		//부모창 opener
		opener.frm.mid.value=id;
		//현재 창 닫기
		window.close();
	}
</script>
</body>
</html>
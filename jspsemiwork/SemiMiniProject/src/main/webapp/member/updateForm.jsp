<%@page import="java.util.StringTokenizer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String num=request.getParameter("num");

	MemberDao dao=new MemberDao();
	
	MemberDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//이메일 분리(@기준으로)
	/* int idx=dto.getEmail().indexOf('@');
	String email1=dto.getEmail().substring(0, idx); //0~(idx-1)
	String email2=dto.getEmail().substring(idx+1); //idx+1번지부터 끝까지 추출 */
	
	//@를 구분자로 분리
	StringTokenizer st=new StringTokenizer(dto.getEmail(),"@");
	String email1=st.nextToken();
	String email2=st.nextToken();
%>
<script type="text/javascript">
$(function(){
	
	$(".mod").click(function(){
		
		var name=$("#name").val();
		var email=$("#email").val();
		var num=$("#num").val();
		
		
		location.href='memberUpdate.jsp?num='+num+"&name="+name+"&email="+email;
		
	})
	
	$("#selemail").change(function(){
			
			if($(this).val()=='-')
				$("#email2").val('');
			else
				$("#email2").val($(this).val());
		})
})
</script>
<div style="margin: 100px 200px;">
<form action="memberUpdate.jsp" method="post" onsubmit="return check(this)">
<input type="hidden" name="num" value="<%=num%>">
	<table class="table table-bordered" style="width: 500px;">
		<caption align="top"><b>수정</b></caption>
		<tr>
			<th width="100" class="table-info">아이디</th>
			<td class="input-group">
				<%=dto.getId() %>
			</td>
		</tr>
		
		
		
		<tr>
			<th width="100" class="table-info">이름</th>
			<td class="input-group">
				<input type="text" name="name" class="form-control"
				maxlength="10" required="required" style="max-width: 150px;"
				value="<%=dto.getName()%>">&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		
		<tr>
			<th width="100" class="table-info">이메일</th>
			<td class="input-group">
				<input type="text" name="email1" id="email1" class="form-control"
				required="required" style="max-width: 80px;"
				value="<%=email1%>">&nbsp;&nbsp;&nbsp;
				<b>@</b>&nbsp;&nbsp;&nbsp; 
				<input type="text" name="email2" id="email2" class="form-control"
				required="required" style="max-width: 150px;"
				value="<%=email2%>">
				<select id="selemail" class="form-control">
					<option value="-">직접 입력</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="hanmail.net">다음</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				<button type="submit" class="btn btn-outline-info"
				style="width: 100px;">수정하기</button>
				<button type="reset" class="btn btn-outline-danger"
				style="width: 100px;">초기화</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
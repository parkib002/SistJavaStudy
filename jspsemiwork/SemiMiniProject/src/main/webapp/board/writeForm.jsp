<%@page import="data.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
	//답글일 경우 읽어야할 값 처리
	String num=request.getParameter("num");
	//새글일 경우 null, 답글은 원글의 num이 넘어오는 것
	String regroup="",restep="",relevel="",subject="";
	//db선언
	BoardDao dao=new BoardDao();

	//답글인 경우 제목에 원글 제목 붙여주기
	if(num!=null)
	{
		regroup=request.getParameter("regroup");
		restep=request.getParameter("restep");
		relevel=request.getParameter("relevel");
		
		subject="[답글]"+dao.getData(num).getSubject();
	}
%>
<body>
	<div>
		<form action="board/writeAction.jsp" method="post">
			<!-- hidden -->
			<%
			 //답글일 때만 hidden으로 넘긴다
			 if(num!=null)
			 {%>
				<input type="hidden" name="num" value="<%=num%>"> 
				<input type="hidden" name="regroup" value="<%=regroup%>"> 
				<input type="hidden" name="restep" value="<%=restep%>"> 
				<input type="hidden" name="relevel" value="<%=relevel%>"> 
			 <%}
			%>
			
			<table class="table table-bordered" style="width: 500px;">
				<caption align="top"><b><%=num==null?"새글등록":"답글등록" %></b></caption>
				<tr>
					<th class="table-warning" width="100">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control"
						style="width: 100px;">
					</td>
				</tr>
				
					<tr>
					<th class="table-warning">제목</th>
					<td>
						<input type="text" name="subject" class="form-control"
						style="width: 100px;" value="<%=subject%>">
					</td>
				</tr>
					<tr>
					<td colspan="2">
						<textarea style="width: 480px; height: 150px;"
						class="form-control" name="content" required="required"></textarea>
					</td>
				</tr>
				
				
					<tr>
					<th class="table-warning">비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control"
						style="width: 100px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info btn-sm"
						style="width: 150px;">게시글 등록</button>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>
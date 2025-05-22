<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.BoardDto"%>
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
	String num=request.getParameter("num");

	BoardDao dao=new BoardDao();
	BoardDto dto=dao.getData(num);
	//조회수 증가
	dao.updateReadCount(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<div class="boardcotent">
		<table class="table table-bordered" style="width: 700px;">
			<caption align="top"><b>내용 확인</b></caption>
				<tr>
					<td>
						<b style="font-size: 1.3em"><%=dto.getSubject() %></b>
						<br>
						<b><%=dto.getWriter() %></b>
						<span style="color: gray"><%=sdf.format(dto.getWriteday()) %></span>
						<span style="color: gray">조회 <%=dto.getReadcount() %></span>
					</td>	
				</tr>
				<tr height="150">
					<td>
							<%=dto.getContent().replace("\n", "<br>") %>
						<br>
						<!-- 버튼들 -->
						<div class="buttons" style="float: right;">
							<button type="button" class="btn btn-outline-success"
							onclick="location.href='index.jsp?main=board/writeForm.jsp'">글쓰기</button>
							<button type="button" class="btn btn-outline-success"
							onclick="location.href='index.jsp?main=board/writeForm.jsp?num=<%=num%>&regroup=<%=dto.getRegroup()%>&restep=<%=dto.getRestep()%>&relevel=<%=dto.getReglevel()%>'">답글</button>
							<button type="button" class="btn btn-outline-success"
							onclick="location.href=''">수정</button>
							<button type="button" class="btn btn-outline-success"
							onclick="location.href='index.jsp?main=board/deletePassForm.jsp?num=<%=num%>'">삭제</button>
							<button type="button" class="btn btn-outline-success"
							onclick="location.href='index.jsp?main=board/boardList.jsp'">목록</button>
						</div>
					</td>
				</tr>
		</table>	
	</div>
</body>
</html>
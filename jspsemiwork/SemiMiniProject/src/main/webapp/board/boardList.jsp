<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BoardDao"%>
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
<title>Insert title here</title>
</head>
<%
	//dao
	BoardDao dao=new BoardDao();
	List<BoardDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div class="writer">
	<button type="button" class="btn btn-outline-info"
	onclick="location.href='index.jsp?main=board/writeForm.jsp'">새글쓰기</button>
</div>

<div class="board">
	<table class="table table-bordered" style="width: 800px;">
		<caption align="top"><b>총<%=list.size() %>개의 게시글이 있습니다</b></caption>
		<tr class="table-success" align="center">
			<th style="width: 80px;">번호</th>	
			<th style="width: 380px;">제목</th>
			<th style="width: 120px;">작성자</th>
			<th style="width: 180px;">작성일</th>	
			<th style="width: 80px;">조회</th>
		</tr>
		
		<%
			if(list.size()==0)
			{%>
				<tr>
					<td colspan="5" align="center">
						<b>등록된 게시글이 없습니다</b>					
					</td>
				</tr>
			<%}else{
				
				for(int i=0;i<list.size();i++)
				{
					BoardDto dto=list.get(i);
				%>
					<tr>
						<td align="center"><%=list.size()-i %></td>
						<td>
							<!-- 답글인 경우 공백_1레벨 당 2칸 or 3칸 -->	
							<%
								for(int j=1;j<=dto.getReglevel();j++)
								{%>
									&nbsp;&nbsp;&nbsp;
								<%}
							%>			
							<!-- 답글이면 답글 이미지 출력 -->
							<%
								if(dto.getReglevel()>0)
								{%>
									<img alt="" src="image2/img/re.png" style="width: 10px;height: 10px;">
								<%
								//원글이 없는 경우
								boolean flag=dao.isGroupStep(dto.getRegroup());
								boolean flag2=dao.isGrouplevel(dto.getRegroup(), dto.getReglevel());
								
								if(dto.getRestep()>0)
								{
									if(!flag)//원글이 없는 경우
									{%>
										<span style="color: red;">[원글이 없는 답글]</span>
									<%}else if(flag && !flag2){%>
										<span style="color: blue;">[원답글이 없는 답글]</span>
									<%}
								}
								}
							%>		
							
							<a href="index.jsp?main=board/content.jsp?num=<%=dto.getNum() %>">
							<%=dto.getSubject() %></a>
						</td>
						<td><%=dto.getWriter() %></td>
						<td><%=sdf.format(dto.getWriteday()) %></td>
						<td><%=dto.getReadcount() %></td>
					</tr>
				<%}
			%>
				
			<%}
		%>
	</table>
</div>
</body>
</html>
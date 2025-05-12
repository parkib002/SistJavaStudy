<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.UploadDto"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.UploadDao"%>
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
<style type="text/css">
 a{
 	text-decoration: none;
 	color: black;
 }
</style>
</head>
<% 
	//db선언
	UploadDao dao=new UploadDao();

	//리스트 가져오기
	//List<UploadDto> list=dao.getAllDatas();

	//페이징처리
	//전체개수
	int totalCount=dao.getTotalCount();
	
	int perPage=5; //한페이지에 보여질 글의 개수
	int perBlock=5; //한블럭당 보여질 페이지의 개수
	int startNum; //db에서 가져올 글의 시작번호(mysql:0 오라클:1번)
	int startpage; //각 블럭당 보여질 시작 페이지
	int endPage; //각 블럭당 보여질 끝 페이지
	int currentPage; //현재 페이지
	int totalPage; //총 페이지
	
	int no; //각 페이지당 출력할 시작번호

	//현재 페이지 일기, 단 null일 경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총 페이지수를 구한다
	//총 글의 개수/한 페이지당 보여질 개수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각 블럭당 보여질 시작 페이지
	//perBlock=5일 경우 현재 페이지가 1~5 시작1, 끝5
	//만약 현재 페이지가 13일 경우는 시작11, 끝15
	startpage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startpage+perBlock-1;
	
	//총 페이지가 23개일 경우 마지막 블럭은 25가 아니라 23이다
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각 페이지에서 보여질 시작 번호
	//예: 1페이지-->0 2페이지-->5 3페이지-->10
	startNum=(currentPage-1)*perPage;
	
	//각 페이지당 출력할 시작번호
	//예를들어 총 글 개수가 23 1페이지:23 2페이지:18 3페이지:13...
	no=totalCount-(currentPage-1)*perPage;
	
	List<UploadDto> list=dao.getPagingList(startNum, perPage);
%>
<body>
<div style="margin: 100px 100px; width: 800px;">
	<b><%=totalCount %>개의 글이 있습니다</b>
	
	<br>
	
	<table class="table table-bordered">
	 <caption align="top"><b>게시판형 목록보기</b>
	 	<button type="button" class="btn btn-warning btn-sm"
	 	onclick="location.href='imageList.jsp'" style="margin-left: 650px;">앨범형게시판</button>
	 	<button type="button" class="btn btn-warning btn-sm"
	 	onclick="location.href='addForm.jsp'" style="margin-left: 650px;">글쓰기</button>
	 </caption>
	 
	 <tr class="table-success">
	 	<th width="100">번호</th>
	 	<th width="350">제목</th>
	 	<th width="130">작성자</th>
	 	<th width="180">작성일</th>
	 	<th width="100">조회수</th>
	 </tr> 
	 
	 <%
	 //날짜형식
	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 
	 for(int i=0;i<list.size();i++)
	 {
		 UploadDto dto=list.get(i); //i번째 리스트 값%>
		 
		 <tr>
		 	<td><%=no-i %></td>
		 	<!-- 제목 클릭시 content보기로 간다 -->
		 	<td>
		 		<a href="detailView.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage%>"><%=dto.getSubject() %></a>
		 	</td>
		 	<td><%=dto.getWriter() %></td>
		 	<td><%=sdf.format(dto.getWriteday()) %></td>
		 	<td><%=dto.getReadcount() %></td>
		 </tr>
	 <%}
	 %>
	</table>
	
	<!-- 페이지 번호 출력 -->
	<div style="width: 800px;">
	<ul class="pagination">
	<%
		//이전
		if(startpage>1)
		{%>
			<li class="page-item">
				<a class="page-link" href="boardList.jsp?currentPage=<%=startpage-1%>"
				style="color: black;">
					이전
				</a>
			</li>
		<%}
	
		for(int pp=startpage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="page-item active">
					<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}else{%>
				<li class="page-item">
					<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}
			
				
		}
			//다음
			if(endPage<totalPage)
			{%>
				<li class="page-item">
				<a class="page-link" href="boardList.jsp?currentPage=<%=endPage+1%>"
				style="color: black;">
					다음
				</a>
			</li>
			<%}
	%>
	</ul>
	</div>
</div>
</body>
</html>
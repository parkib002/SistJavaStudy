<%@page import="java.text.SimpleDateFormat"%>
<%@page import="guest.GuestDao"%>
<%@page import="guest.GuestDto"%>
<%@page import="java.util.List"%>
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
<%
	GuestDao dao=new GuestDao();
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

//현재 페이지 읽기, 단 null일 경우는 1페이지로 준다
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

	List<GuestDto> list=dao.selectGuest(startNum, perPage);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
</head>
<body>
	<jsp:include page="guestForm.jsp"/>
	<hr>
	<h3>총 <%=totalCount %>개의 방명록글이 있습니다</h3>
	<div>
	<table class="table table-bordered" style="width: 500px;">
	<tr>
		<th>번호</th>
		<th>사진</th>
		<th>내용</th>
		<th>작성일자</th>
	</tr>
	
	
	<%
		for(int i=0;i<list.size();i++)
		{
		GuestDto dto=list.get(i);%>
		<tr>
			<td><%=no-i %></td>
			<td><img src='../save/<%=dto.getPhoto() %>'
			style="max-width: 30px; max-height: 30px;"></td>
			<td><%=dto.getContent() %> </td>
			<td><%=sdf.format(dto.getGaipday()) %> </td>
		</tr>	
		<%}
	%>
	</table>
	</div>
	
	<div style="width: 800px;">
	<ul class="pagination">
	<%
		//이전
		if(startpage>1)
		{%>
			<li class="page-item">
				<a class="page-link" href="guestList.jsp?currentPage=<%=startpage-1%>"
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
					<a class="page-link" href="guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}else{%>
				<li class="page-item">
					<a class="page-link" href="guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}
			
				
		}
			//다음
			if(endPage<totalPage)
			{%>
				<li class="page-item">
				<a class="page-link" href="guestList.jsp?currentPage=<%=endPage+1%>"
				style="color: black;">
					다음
				</a>
			</li>
			<%}
	%>
	</ul>
	</div>
</body>
</html>
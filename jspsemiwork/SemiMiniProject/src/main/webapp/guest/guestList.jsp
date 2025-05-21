<%@page import="data.dao.GuestAnswerDao"%>
<%@page import="data.dto.GuestAnswerDto"%>
<%@page import="org.apache.el.parser.AstDiv"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
	
	String loginok=(String)session.getAttribute("loginok");
	
	GuestAnswerDao dao2=new GuestAnswerDao();
	
	
	
%>
</head>
<script type="text/javascript">
$(function(){
	
	$(".answer").hide();

	 $(".toggle-answer-btn").click(function() {
	        // 클릭된 버튼 기준으로 가장 가까운 게시글 div 내의 .answer를 찾음
	        $(this).closest("div").siblings(".answer").slideToggle();
	    });
	
	$(".del").click(function(){
		
		var idx=$(this).attr("idx");
		
		$.ajax({
			
			type:"post",
			url:"guest/answerDelete.jsp",
			dataType:"html",
			data:{"idx":idx},
			success: function(){
				
				location.reload();
			}
		})
		
		})
		
		$(".mod").click(function(){
			
		var idx=$(this).attr("idx");
		
		//alert(idx)
		
		$("#idx").val(idx);
		
		$.ajax({
			
			type:"get",
			dataType:"json",
			url:"guest/answerContent.jsp",
			data:{"idx":idx},
			success:function(res){
				
				
				
				$("#idx").val(res.idx);
				$("#ucontent").val(res.content);
				
			}
		})
		
		})
		
		$("#btnupdate").click(function(){
			
				var idx=$("#idx").val();
				var content=$("#ucontent").val();
		
			$.ajax({
				
				type:"get",
				dataType:"html",
				url:"guest/answerUpdate.jsp",
				data:{"idx":idx,"content":content},
				success:function(){
					
					location.reload();
				}
			})
		})
		
})
</script>
<body>
	<jsp:include page="guestForm.jsp"/>
	<hr>
	<h3 style="font-family: Dongle; font-size: 3em;">총 <%=totalCount %>개의 방명록글이 있습니다</h3>
	<div>
	
	
	<%
		for(int i=0;i<list.size();i++)
		{
		GuestDto dto=list.get(i);%>
		<div style="border: 1px solid black; border-radius:10px 10px 10px 10px; margin: 20px; 20px; width: 400px;
		font-family: Orbit;">
			<h3>번호: <%=no-i %></h3>
			<h3>아이디: <%=dto.getMyid() %></h3>
			<h3>이미지: <img src='./save/<%=dto.getPhoto() %>'
			style="max-width: 30px; max-height: 30px;"></h3>
			<h3>내용: <%=dto.getContent() %> </h3>
			<h3>작성날짜: <%=sdf.format(dto.getGaipday()) %> </h3>
		
		<%
			String sessionid=(String)session.getAttribute("myid");
			
			//로그인중이면서 로그인한 아이디와 글쓴 아이디가 같을 경우에만 보이게
			if(loginok!=null && sessionid.equals(dto.getMyid())){
				%>
			<hr>	
			<div style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<i class="bi bi-pencil-fill mod"></i>
			<i class="bi bi-trash-fill del"
			onclick="location.href='./index.jsp?main=/guest/deleteAction.jsp?num=<%=dto.getNum()%>&photo=<%=dto.getPhoto()%>'"></i>
			<button type="button" class="btn btn-info btn-sm toggle-answer-btn"
			>댓글등록/보기</button>
			<hr>
			</div>
			<%}
			else{%>
			<div style="text-align: center;">
			<hr>
				<button type="button" class="btn btn-info btn-sm toggle-answer-btn" 
			>댓글등록/보기</button>
			<hr>
			</div>
			<%}
		%>
		
			<div class="answer">
		<%
			if(loginok!=null){%>
				
				<div class="answerform">
					<form action="guest/answerInsert.jsp" method="post" class="input-group">
					<input type="hidden" name="num" value="<%=dto.getNum()%>">
					<input type="hidden" name="myid" value="<%=sessionid%>">
					<textarea style="width: 230px; height: 70px;"
					name="content" required="required"
					class="form-control"></textarea>
					<button type="submit" class="btn btn-info"
					style="width: 50px; height: 70px; font-size: 15px;">등록</button>
					</form>				
				</div>
			<%}
		%>	
				<div class="answerlist">
					<%List<GuestAnswerDto> list2=dao2.getAllGuestAnswer(dto.getNum());
					%><h6>개수: <%=list2.size() %></h6>
					<%for(int j=0;j<list2.size();j++){
						GuestAnswerDto dto2=list2.get(j);
					%>
					
					<h6>아이디: <%=dto2.getMyid() %></h6>
					<h6>댓글: <%=dto2.getContent().replace("\n", "<br>") %></h6>
					<%
						//글작성자와 댓글 쓴 작성자가 같을 경우
						if(dto.getMyid().equals(dto2.getMyid())){%>
							<h6>작성자</h6>
						<%}
					
						if(loginok!=null && sessionid.equals(dto2.getMyid())){%>
							
							<i class="bi bi-trash-fill del" style="color: red" idx=<%=dto2.getIdx() %>></i>
							<i class="bi bi-pencil-fill mod" style="color: blue" idx=<%=dto2.getIdx() %>
							data-bs-toggle="modal" data-bs-target="#myModal"></i>
						<%}
							
					%>
						
					</ul>
					<hr>
					<%}%>
				</div>
			</div>
		</div>
		<%}
	%>
	
	
	</div>
	
	<div style="width: 400px;" class="d-flex justify-content-center">
	<ul class="pagination">
	<%
		//이전
		if(startpage>1)
		{%>
			<li class="page-item">
				<a class="page-link" href="./index.jsp?main=guest/guestList.jsp?currentPage=<%=startpage-1%>"
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
					<a class="page-link" href="./index.jsp?main=guest/guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}else{%>
				<li class="page-item">
					<a class="page-link" href="./index.jsp?main=guest/guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
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
	

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="updateform">
        <input type="text" class="form-control" id="ucontent" value="">
        <input type="hidden" value="" id="idx">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnupdate">수정</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
	
	</div>
</body>
</html>
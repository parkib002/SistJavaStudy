<%@page import="uploadboard.UboardAnswerDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.UploadDao"%>
<%@page import="uploadboard.UploadDto"%>
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
<script type="text/javascript">
	$(function(){
		
		//처음시작시 댓글 목록 호출
		list();
		
		//insert
		var num=$("#num").val();
		console.log(num);
		
		$("#btnSend").click(function(){
			
			
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nickname==''){
				alert('닉네임을 입력 후 저장해주세요');
				return;
			}
			
			if(content==''){
				alert('댓글 내용을 입력 후 저장해주세요');
				return;
			}
			
			//ajax로 insert해보기
			$.ajax({
				
				type:"post",
				url:"insertAnswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					
					//alert("insert성공!");
					$("#nickname").val("");
					$("#content").val("");
					
					//list호출
					list();
					
				}
			
			})
				
				
		});
		
		$(document).on("click",".del",function(){
			
			$.ajax({
				
				type:"get",
				url:"deleteAnswer.jsp",
				dataType:"html",
				data:{"idx":$(this).attr("idx")},
				success:function(){
				list();
				}
				
			})
		})
	});
	
	function list()
	{
		//댓글출력
		console.log("list num="+$("#num").val());
		
		$.ajax({
			
			type:"get",
			url:"listAnswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(res){
				
				//댓글 개수 출력
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res,function(idx,item){
					
					s+="<div>"+item.nickname+": "+item.content+"&nbsp;&nbsp;&nbsp;&nbsp;";
					s+="<span class='aday'>"+item.writeday+"</span&nbsp;&nbsp;&nbsp;&nbsp;>";
					s+="<i class='bi bi-trash del' idx="+item.idx+"></i>";
					s+="<i class='bi bi-pencil-square'></i>"
					s+="</div>";
					
				});
				
				$("div.alist").html(s);
			}
		});
	};
</script>
<%
	String num=request.getParameter("num");

	UploadDao dao=new UploadDao();
	
	dao.updateReadCount(num);
	
	UploadDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//현재 페이지 번호
	String currentPage=request.getParameter("currentPage");
	
%>
</head>
<body>

<input type="hidden" id="num" value="<%=num%>">
<div>
	<table class="table table-bordered" style="width: 600px;">
		<tr>
		<td>		
		<h1>제목: <%=dto.getSubject() %></h1>
		<br><br>
		<h3>작성자: <%=dto.getWriter() %></h3>
		<h5>작성일: <%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;&nbsp;조회수: <%=dto.getReadcount() %></h5>
		</td>
		</tr>
		
		
		<tr>
		<td>
		<%=dto.getContent().replace("\n", "<br>") %>
		<br>
		<a href="../save/<%=dto.getImgname()%>">
		<img src="../save/<%=dto.getImgname()%>" style="max-width: 200px;"></a>
		</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td>
				<b class="acount">댓글<span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				<div class="aform input-group">
				<input type="text" id="nickname" class="form-control"
				style="width: 80px;" placeholder="닉네임">
				<input type="text" id="content" class="form-control"
				style="width: 300px; margin-left: 10px;"placeholder="댓글메세지">
				<button type="button" id="btnSend"
				class="btn btn-info btn-sm" style="margin-left: 10px">저장</button>
				</div>
			</td>
		</tr>
		
		<tr>
		<td align="center">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='addForm.jsp'">글쓰기</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">수정</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">삭제</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='boardList.jsp?currentPage=<%=currentPage%>'">목록</button>
		</td>
		</tr>
	</table>
</div>
</body>
</html>
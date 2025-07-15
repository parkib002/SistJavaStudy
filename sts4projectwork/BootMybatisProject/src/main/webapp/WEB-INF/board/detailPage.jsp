<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
  body{
    width: 100%;
    margin: 0 ;
  }
  
  .container { 
    display: flex;
    flex-direction: column; /* 세로로 쌓기 */
    align-items: center;     /* 가로 정렬 중앙 */
    justify-content: center; /* 세로 정렬 중앙 */
    height: 100%;
  }
</style>
<script type="text/javascript">
$(function(){
		
	num=$("#num").val();
	
	//리스트
	list();
	
	$("#btnansweradd").click(function(){
			
		var content=$("#content").val();
		
		if(content.trim().length==0){
			alert("댓글 내용을 입력해주세요");
			return;
		}
		
		$.ajax({
			
			type:"post",
			url:"ainsert",
			dataType:"html",
			data:{"num":num,"content":content},
			success:function(){
				
				
				list();
				
				$("#content").val('');
			}
		})
	})
	
	$(document).on("click",".del",function(){
		
		var idx=$(this).attr("id");

		var a=confirm("해당 댓글을 삭제하시겠습니까?");
		
		if(a){
		
		$.ajax({
			
			type:"DELETE",
			url:"adelete/"+idx,
			dataType:"html",
			success:function(){
				
				list();
			}
		})
		
		}else{
			return;
		}
	})
})

function list(){
	
	var loginok="${sessionScope.loginok}";
	var myid="${sessionScope.myid}";
	
	$.ajax({
		
		type:"get",
		url:"alist",
		dataType:"json",
		data:{"num":num},
		success:function(res){
			
			 $(".alist").empty();
			
			var s="";
			$.each(res,function(i,item){
				s+="<br>";
				s+="<b>";
				s+=item.name;
				s+="("+item.myid+")";
				if(loginok=='yes' && myid==item.myid){
				s+="<i class='bi bi-pencil' style='font-size:0.9em; color: blue;'></i>";
				s+="<i class='bi bi-trash del' style='font-size:0.9em; color: red;' id='"+item.idx+"'></i>";
				}
				s+=":"+item.content;
				s+="<span class='day' style='float: right; color: gray;'>"+item.writeday+"</span>";
				s+="</b>";
			})
			
			$(".alist").append(s);
			$(".acount").text(res.length+"개");
		}
	})
	
}
</script>
</head>
<body>
<div class="container">
	<jsp:include page="../../layout/header.jsp"/>
<table class="table table-bordered" style="width: 600px;">
	<tr>
		<td>
			<h4><b>${dto.subject }</b></h4>
			
			<span style="font-size: 9pt; color: gray; float: right;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/> </span>
			<br>
			<b>작성자: ${dto.name }(${dto.myid })</b>&nbsp;&nbsp;&nbsp;&nbsp;
			
			<c:if test="${dto.uploadfile!='no' }">
				<span style="float: right;">
				<a href="download?clip=${dto.uploadfile}"><i class="bi bi-file-earmark-arrow-down"></i>
				<b>${dto.uploadfile }</b></a>
				</span>
			</c:if>
				<br>
				<span style="float: right;">조회수: ${dto.readcount }</span>
		</td>
	</tr>
	
	<tr>
		<td>
			<c:if test="${dto.uploadfile!='no' }">
				<img alt="" src="../boardsave/${dto.uploadfile }">
			</c:if>
			<br><br>
			<pre>
				${dto.content }
			</pre>
			
		</td>
	</tr>
	
	<!-- 댓글 -->
	<tr>
		<td>
			<b>댓글  <span class="acount">0</span></b><br>
			
			<div class="alist">댓글 목록</div>
			
			<input type="hidden" id="num" value="${dto.num }">
			
			<c:if test="${sessionScope.loginok!=null }">
				<div class="aform input-group">
					<input type="text" class="form-control"
					style="width: 500px;" placeholder="댓글을 입력하시오" id="content">&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-info"
					style="width: 60px;" id="btnansweradd">전송</button>
				</div>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td align="center">
			<!-- 글쓰기: 로그인 중일때만 보이게 -->
			<c:if test="${sessionScope.loginok!=null }">
				<button type="button" class="btn btn-outline-info" onclick="">글쓰기</button>
			</c:if>
			<!-- 수정삭제: 로그인중이면서 세션 아이디가 글쓴이와 같은 아이디일 경우 보이게 -->
			<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
				<button type="button" class="btn btn-outline-primary" onclick="">수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="">삭제</button>
			</c:if>
			
			<button type="button" class="btn btn-outline-success" onclick="location.href='list'">목록</button>
		</td>
	</tr>
	
</table>
</div>
</body>
</html>
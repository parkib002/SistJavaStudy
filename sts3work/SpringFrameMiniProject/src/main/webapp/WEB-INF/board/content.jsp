<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	
	$(".del").click(function(){
		
		var idx=$(this).attr("id");
		var pass=prompt("비밀번호를 입력해주세요");
		
		if(pass==null)
			return;
		
		$.ajax({
			
			type:"get",
			url:"delete",
			dataType:"json",
			data:{"idx":idx,"pass":pass},
			success:function(res){
				
				if(res.result==1){
					
					alert("댓글이 정상적으로 삭제되었습니다");
					location.reload();
				}else
					alert("비밀번호가 일치하지 않습니다");
				
			}
				
		})
	})
	
})

</script>
<body>
<table class="table table-bordered" style="width: 600px;">
	<tr>
		<td>
			<h3>${dto.subject }</h3>
			<br>
			<span style="float: right; margin-right: 20px;">조회: ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>
			</span>
			<h6>작성자: ${dto.writer }</h6>
			
			<div>
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="pho" items="${dto.photo }" delims=",">
						<a href="download?clip=${pho }">
							<i class="bi bi-cloud-download"></i>
							<span>${pho }</span>
						</a>
					</c:forTokens>
				</c:if>
			</div>
		</td>
	</tr>
	
	<tr>
		<td>
			<pre>
				${dto.content }
			</pre>
				
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="im" items="${dto.photo }" delims=",">
						<a><img src="../photo/${im }" 
						style="width: 150px; height: 150px; border-radius: 20px;
						border:2px solid purple;"></a>
					</c:forTokens>
				</c:if>
		</td>
	</tr>
	
	<!-- 댓글 -->
	<tr>
		<td>
			<div id="answer">
			<b>전체 댓글: ${acount }개</b><br>
			<c:forEach var="adto" items="${alist }" varStatus="i">
					 ${adto.nickname } : ${adto.content } &nbsp;&nbsp;
					<span style="color: gray; font-size: 0.9em;">
						<fmt:formatDate value="${adto.writeday }" pattern="yyyy-MM-dd"/>
					</span>	&nbsp;&nbsp;
						<i class="bi bi-pencil-square mod" style="cursor: pointer;" id="${adto.idx }"></i>
						<i class="bi bi-trash-fill del" style="cursor: pointer;" id="${adto.idx }"></i><br>
			</c:forEach>
			</div>
			
			
			<form action="ainsert" method="post">
				<input type="hidden" name="num" value="${dto.num }">
				<input type="hidden" name="currentPage" value="${currentPage }">
				<div class="input-group">
				<input type="text" name="nickname" class="form-control"
				style="width: 100px;" required="required" placeholder="닉네임">
				<input type="password" name="pass" class="form-control"
				style="width: 100px;" required="required" placeholder="비밀번호"></div>
				<br><br>
				<input type="text" name="content" class="form-control"
				style="width: 500px;" required="required" placeholder="댓글내용입력">
				<button type="submit" class="btn btn-info btn-sm">확인</button>
			</form>
		</td>
	</tr>
	
	<tr>
		<td align="right">
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='form'">글쓰기</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글쓰기</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='deleteform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='list?currentPage=${currentPage}'">목록</button>
		</td>
	</tr>
</table>
</body>
</html>
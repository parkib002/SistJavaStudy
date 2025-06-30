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
	
	$(".a").click(function(){
		
		$(this).css("color","green");
		$(".b").css("color","gray");
		
		
		$.ajax({
		
			type:"get",
			url:"list1",
			dataType:"json",
			success:function(res){
						
				$("#dataBody").empty();
				$("#list").html("카드형게시판");
				
				var s="";
				for(var i=0;i<res.list.length;i++){
			   
					let item = res.list[i];
				s+="<tr>";
				s+="<td>제목: "+item.subject+"</td>";
				s+="<td>내용: "+item.content+"</td>";
				s+="</tr>";
				}
				
				$("#dataBody").html(s); 
			}
		
		})
	})
	
	$(".b").click(function(){
		
		$(this).css("color","green");
		$(".a").css("color","gray");
		
		$.ajax({
			
			type:"get",
			url:"list2",
			dataType:"json",
			success:function(res){
				
				$("#list").empty();
				$("#dataBody").empty();
				$("#list").html("앨범형게시판");
				
				var s="";
				for(var i=0;i<res.photo.length;i++){
			   
					 if (i % 4 === 0) s += "<tr>";

		                let item2 = res.photo[i];
		                s += "<td style='padding:10px; text-align:center;'>";
		                s += "<img src='../photo/" + item2 + "' style='width:150px;'>";
		                s += "</td>";

		                if (i % 4 === 3) s += "</tr>";
		            }

		            if (res.photo.length % 4 !== 0) s += "</tr>";
				
			}
				$("#dataBody").html(s); 
			}
		
		})
	})
	
})

</script>
<body>
	<!-- RestApi를 이용한 2개의 리스트 출력 (페이징처리 없이 출력할것)
	/rest/list1: 아이콘 클릭시 제목이랑 내용위주의 출력(카드형)
	/rest/list2: 아이콘 클릭시 사진이 있는 경우에만 이미지 리스트 출력 (앨범형) 
	ajax이용해서 출력할 것 
	sql,dao 전체글 출력하는 메서드 추가
	RestController 이용해서 출력할 것 -->
	
<table class="table table-bordered" style="width: 800px;">
	<caption align="top"><b id="list">카드형게시판</b>
		<span><button type="button" class="btn btn-success btn sm"
		onclick="location.href='../board/form'">글쓰기</button></span>
		<i class="bi bi-card-list a" style="font-size: 2em; color: green;"></i>
		<i class="bi bi-list-task b" style="font-size: 2em;"></i>
	</caption>
	
	<tbody id="dataBody">
	<c:forEach var="dto" items="${list }">
	
	<tr>
		<td>제목: ${dto.subject }</td>
		<td>내용: ${dto.content }</td>
	</tr>
	
	</c:forEach>
		
	</tbody>
	
	

</table>

</body>
</html>
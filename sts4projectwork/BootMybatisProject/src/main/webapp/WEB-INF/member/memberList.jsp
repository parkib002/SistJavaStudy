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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
</head>
<body>
<script type="text/javascript">
	$(function(){
		
		$("#allcheck").click(function(){
			
			var chk=$(this).is(":checked");
			
			$(".del").prop("checked",chk);
		})
		
		$(".del").on("change", function() {
    	// 전체 체크박스 개수
	    let total = $(".del").length;
	    // 체크된 개수
	    let checked = $(".del:checked").length;
	
	    // 모두 체크돼 있으면 전체 체크박스도 체크
	    // 하나라도 해제돼 있으면 전체 체크박스 해제
	    $("#allcheck").prop("checked", total === checked);
});
		
		$("#delete").click(function(){
			
			var cnt=$(".del:checked").length;
			
			if(cnt==0){
				alert("삭제할 회원을 선택해주세요")
				return;
			}
		$(".del:checked").each(function(i,elt){
			
			var num=$(this).attr("num");
			console.log(num);
			
			$.ajax({
				
				type:"post",
				url:"delete",
				dataType:"html",
				data:{"num":num},
				success:function(){
					
					location.reload();
				}
				
			})
			
		})
		
		})
		
	})
	
</script>
<div class="container">
	<jsp:include page="../../layout/header.jsp"/>


<div class="alert alert-success" style="width: 800px;">
	<b>총 ${count }명의 회원이 있습니다</b>
</div>

	<table class="table table bordered" style="width: 800px;">
		<tr>
			<th>번호</th>
			<th>회원명</th>
			<th>아이디</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>가입일</th>
			<th><input type="checkbox" id="allcheck">강퇴</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
		 
		 <tr>
		 <td>${i.count } </td>
		 <td>${dto.name } </td>
		 <td>${dto.id } </td>
		 <td>${dto.hp } </td>
		 <td>${dto.email } </td>
		 <td>${dto.gaipday } </td>
		 <td><input type="checkbox" class="del" num="${dto.num }"> </td>
		</tr>	 
		</c:forEach>
	</table>
	<button type="button" class="btn btn-outline-danger" id="delete">강퇴</button>
	</div>
</body>
</html>
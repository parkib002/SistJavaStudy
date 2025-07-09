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
<script type="text/javascript">
$(function(){

	$(".btnnewphoto").click(function(){
		
		$("#newphoto").trigger("click");
	});
	
	$("#newphoto").change(function(){
		
		var num=$(this).attr("num");
		
		console.log(num);
		
		var form=new FormData();
		
		form.append("photo",$("#newphoto")[0].files[0]);
		form.append("num",num);
		
		console.dir(form);
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"updatephoto",
			processData:false,
			contentType:false,
			data:form,
			success:function(){
				
				location.reload();
			}
		});
	});
	
	$("#btnupdate").click(function(){
		
		var num=$(".btnupdate").attr("num");
		var name=$("#name").val();
		var hp=$("#hp").val();
		var email=$("#email").val();
		
		if(name== '' || hp=='' || email== '')
		{
			alert("수정사항을 모두 입력해주세요");
			return;
		}
	
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"update",
			data:{"num":num,"name":name,"hp":hp,"email":email},
			success:function(){
				
				location.reload();
			}
		})
	})
	
})

function confirmdel(num){
	
	$.ajax({
		
		type:"post",
		dataType:"html",
		url:"delete",
		data:{"num":num},
		success:function(){
			
			alert("정상적으로 탈퇴되었습니다");
			
			location.href='${root}';
		}
	})
	
}
</script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div class="container">
   <jsp:include page="../../layout/header.jsp"></jsp:include>
   
<div  style="margin: 200px; width: 600px;">
       <table class="table table-bordered">
          <c:forEach  var="dto" items="${list }">
          
          <c:if test="${sessionScope!=null && sessionScope.myid==dto.id }">
          
            <tr>
               <td style="width: 220px;" align="center" rowspan="5">
                  <img alt="" src="../membersave/${dto.photo }" width="200px;">
                  <br>
                  <input type="file" id="newphoto" style="display: none;" num="${dto.num }"><br>
                  <button type="button" class="btn btn-outline-info btnnewphoto">사진수정</button>
               </td>
               <td>아이디:  ${dto.id }</td>
               <td rowspan="5" valign="middle" align="center">
                  <button type="button" class="btn btn-outline-warning btn-sm btnupdate"
                  num="${dto.num }" data-bs-toggle="modal" data-bs-target="#updateModal">수정</button><br><br>
                  <button type="button" class="btn btn-outline-danger btn-sm"
                  onclick="confirmdel('${dto.num}')">탈퇴</button>
               </td>
            </tr>
            <tr>
              <td>${dto.name }</td>
            </tr>
            <tr>
              <td>${dto.hp }</td>
            </tr>
            <tr>
              <td>${dto.email }</td>
            </tr>
            <tr>
              <td>${dto.gaipday }</td>
            </tr>
            
           </c:if> 
            
           
          </c:forEach>
       </table>
    </div>
</div>

<div class="modal" id="updateModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">회원정보수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
  <div style="display: flex; gap: 10px; align-items: stretch;">
    
  <div style="display: flex; flex-direction: column; gap: 10px;">
     <c:forEach  var="dto" items="${list }">
          
          <c:if test="${sessionScope!=null && sessionScope.myid==dto.id }">
      <input type="text" name="name" id="name" style="width: 350px; height: 40px;" class="form-control" value="${dto.name }">
      <input type="text" name="hp" id="hp"  style="width: 350px; height: 40px;" class="form-control" value="${dto.hp }">
      <input type="text" name="email" id="email"  style="width: 350px; height: 40px;" class="form-control" value="${dto.email }">
	      </c:if> 
            
     </c:forEach>
  </div>
    
    <button type="button" class="btn btn-outline-success" style="width: 100px; height: 140px;" id="btnupdate">수정</button>
  </div>
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>
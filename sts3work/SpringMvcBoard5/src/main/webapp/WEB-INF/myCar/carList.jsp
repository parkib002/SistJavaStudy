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
function del(num){
		
	var a=confirm(num+"번째 자동차 정보를 삭제하시겠습니까?")
		
	if(a){
		location.href="delete?num="+num;
	}
}

</script>
<body>
  <c:if test="${totalCount==0 }">
  	<h3 class="alert alert-info">저장된 자동차 정보가 없습니다</h3>
  </c:if>
  
  <c:if test="${totalCount>0 }">
  	<h3 class="alert alert-info">총 ${totalCount }개의 자동차 정보가 있습니다</h3>
  </c:if>
  
  <br>
  <button type="button" class="btn btn-outline-info" style="width: 150px;"
  onclick="location.href='writeform'">차 정보 입력</button>
  
  <table class="table table-bordered" style="width: 1000px;">
  	<tr>
  		<th width="80">번호</th>
  		<th width="180">자동차명</th>
  		<th width="150">가격</th>
  		<th width="100">색상</th>
  		<th width="80">구입일</th>
  		<th width="80">차량등록일</th>
  		<th width="100">수정, 삭제</th>
  	</tr>
  	
  	<c:forEach var="item" varStatus="i" items="${list }">
  	<fmt:formatNumber value="${item.carprice }" var="price" type="currency"/>
  	<fmt:formatDate value="${item.carwriteday }" var="date" pattern="yyyy-MM-dd"/>
  	 	<tr>
  		<td width="80">${totalCount-i.index }</td>
  		<td width="180">${item.carname }</td>
  		<td width="150">${price }</td>
  		<td width="100" style="background-color: ${item.carcolor}"></td>
  		<td width="80">${item.carguip}</td>
  		<td width="80">${date }</td>
  		<td>
  		<button type="button" class="btn btn-outline-success btn-sm"
  		onclick="location.href='updateform?num=${item.num}'">수정</button>
  		<button type="button" class="btn btn-outline-danger btn-sm"
  		onclick="del(${item.num})">삭제</button>
  		</td>
  	</tr>
  	</c:forEach>
  </table>
</body>
</html>
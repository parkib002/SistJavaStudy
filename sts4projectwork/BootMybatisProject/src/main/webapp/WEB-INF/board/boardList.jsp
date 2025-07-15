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
<div class="container">
	<jsp:include page="../../layout/header.jsp"/>
	
<c:if test="${sessionScope.myid!=null}">
<button type="button" class="btn btn-outline-info"
onclick="location.href='addform'">글쓰기</button>
</c:if>

<br>

	<!-- 검색창 -->
	<form action="list">
		<div style="width: 500px;" class="input-group">
			<select style="max-width: 100px;" class="form-control" name="searchcolumn">
					<option value="subject" ${param.searchcolumn == 'subject' ? 'selected' : ''}>제목</option>
				<option value="content" ${param.searchcolumn == 'content' ? 'selected' : ''}>내용</option>
				<option value="name" ${param.searchcolumn == 'name' ? 'selected' : ''}>작성자</option>
				<option value="myid" ${param.searchcolumn == 'myid' ? 'selected' : ''}>아이디</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="text" name="searchword" class="form-control" style="max-width: 300px;" value="${param.searchword }">
			&nbsp;&nbsp;
			<button type="submit" class="btn btn-outline-info">검색</button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-success"
			onclick="location.href='list?searchcolumn=myid&searchword=${sessionScope.myid}'">내가 쓴 글</button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='list'">전체목록</button>
		</div>
	</form>

<br><br>

<table class="table table-bordered" style="width: 1000px;">
	<tr class="table-secondary">
		<th width="80">번호</th>
		<th width="500">제목</th>
		<th width="120">작성자</th>
		<th width="80">조회</th>
		<th width="280">등록일</th>
	</tr>	
	
	<c:if test="${totalCount==0 }">
		<tr>
			<td colspan="5" align="center">
				<b>등록된 글이 없습니다</b>
			</td>
		</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list}" varStatus="i">
		<tr>
			<td>
			${no }
			<c:set var="no" value="${no-1 }"></c:set>
			</td>
			<td>
			<a href="detail?num=${dto.num }&currentPage=${currentPage}">${dto.subject }</a>
			<c:if test="${dto.uploadfile!='no'}">
				<i class="bi bi-card-image" style="color: gray;"></i>
			</c:if>
			</td>
			<td>${dto.myid }</td>
			<td>${dto.readcount }</td>
			<td>
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>
			</td>		
		</tr>
	</c:forEach>
</table>

<!-- 페이지 번호 출력 -->
<div style="width: 800px;">
	<ul class="pagination justify-content-center">
	
<!-- 이전 -->
	<c:if test="${startPage>1}">
			<li class="page-item">
				<a class="page-link" href="list?currentPage=${startPage-1 }"
				style="color: black;">
					이전
				</a>
			</li>
	</c:if>
	
<!-- 페이지 번호 -->
	<c:forEach var="pp" begin="${startPage}" end="${endPage }">
		<c:if test="${pp==currentPage }">
			<li class="page-item active">
				<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
			</li>
		</c:if>
		
		<c:if test="${pp!=currentPage }">
			<li class="page-item">
				<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
			</li>
		</c:if>
	</c:forEach>
				
<!-- 다음 -->
	<c:if test="${endPage<totalPage }">
		<li class="page-item">
			<a class="page-link" href="list?currentPage=${endPage+1 }"
			style="color: black">
			다음
			</a>
		</li>
	</c:if>
	</ul>
  </div>
</div>
</body>
</html>
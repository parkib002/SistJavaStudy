<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="tot" value="${java+spring }"/>
<c:set var="avg" value="${tot/2 }"/>
<pre>
	�ڹ�����: ${java }
	����������: ${spring }
	����: ${tot }
	���: ${avg }
</pre>
</body>
</html>
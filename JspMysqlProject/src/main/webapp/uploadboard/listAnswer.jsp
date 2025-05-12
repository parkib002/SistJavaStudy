<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="uploadboard.UboardAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.UboardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UboardAnswerDao dao=new UboardAnswerDao();

String num=request.getParameter("num");

//전체목록 가져오기
List<UboardAnswerDto> list=dao.getAnswerList(num);

JSONArray arr=new JSONArray();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

for(UboardAnswerDto dto:list){
	
	JSONObject ob=new JSONObject();
	
	ob.put("num", dto.getNum());
	ob.put("idx", dto.getIdx());
	ob.put("nickname", dto.getNickname());
	ob.put("content", dto.getContent());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
	//arr에 추가
	arr.add(ob);
}


%>
<%=arr.toString()%>

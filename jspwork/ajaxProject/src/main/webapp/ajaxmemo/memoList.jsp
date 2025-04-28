<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxmemo.MemoDto"%>
<%@page import="java.util.List"%>
<%@page import="ajaxmemo.MemoDao"%>
<%@page import="oracle.db.DbConnect"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemoDao dao=new MemoDao();

	//전체목록 가져오기
	List<MemoDto>list=dao.getAllMemos();

	JSONArray arr=new JSONArray();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	for(MemoDto dto:list){
		JSONObject ob=new JSONObject();
		
		ob.put("num", dto.getNum());
		ob.put("writer", dto.getWriter());
		ob.put("content", dto.getContent());
		ob.put("emot", dto.getEmot());
		ob.put("writeday", sdf.format(dto.getWriteday()));
		
		//arr에 추가
		arr.add(ob);
	}
	
	
%>
<%=arr.toString()%>
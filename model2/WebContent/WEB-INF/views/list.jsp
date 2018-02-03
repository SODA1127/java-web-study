<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
		요청 객체로부터 속성값얻기
	*/
	ArrayList<String>memberList = (ArrayList<String>) request.getAttribute("memberList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>list.jsp</h1><hr/>
<%
	for(int i = 0; i < memberList.size(); i++){
%>
	<li><%= memberList.get(i) %></li>
<%
	}
%>
<p>
	<a href="menu.do">메뉴로 가기</a>
</p>
</body>
</html>
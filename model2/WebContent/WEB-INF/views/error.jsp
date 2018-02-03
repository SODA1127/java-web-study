<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
		요청 객체로부터 속성값 얻기
	*/
	String MSG = (String) request.getAttribute("MSG");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>error.jsp</h1><hr/>
<div><img alt="이미지" src="image.do" width="100" height="100"></div>
<p><%= MSG %></p>
<p>
	<a href="menu.do">메뉴로 가기</a>
</p>
</body>
</html>
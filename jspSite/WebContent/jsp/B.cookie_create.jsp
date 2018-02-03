<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
	1. 검색어를 파라미터로 받은 후 검색결과를 클라이언트로 응답
	2. 응답시 검색어를 클라이언트에 쿠키로 전송(클라이언트에 저장)
	*/
	request.setCharacterEncoding("UTF-8");
	String keyword = request.getParameter("keyword");
	if(keyword == null || keyword.equals("")){
		response.sendRedirect("B.cookie_create_form.jsp");
	}
	
	//쿠키 객체생성
	String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
	
	Cookie searchCookie = new Cookie("searchCookie", encodedKeyword);
	//쿠키 유효시간 설정 - 설정하지 않는 경우 메모리상 쿠키
	searchCookie.setMaxAge(60*60);
	//응답 객체에 쿠키 붙이기
	response.addCookie(searchCookie);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>검색 결과 후 쿠키심기</h1>
	<ol>
		<li><%= keyword %> content</li>
		<li><%= keyword %> content</li>
		<li><%= keyword %> content</li>
		<li><%= keyword %> content</li>
	</ol>
	<p>
		서버에서 쿠키를 전송 해서 쿠키값이 브라우저에 저장됨
		<br/>
		니안에 쿠기있음<br/>
		<a href="B.cookie_read.jsp">쿠기읽기</a>
	</p>
</body>
</html>
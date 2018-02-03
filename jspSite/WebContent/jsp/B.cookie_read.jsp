<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
		1. 요청객체로부터 쿠키들얻기
	*/
	Cookie[] cookies = request.getCookies();
	
	if(cookies == null){
		//response.sendRedirect("B.cookie_create_form.jsp");
		out.println("<script>");
		out.println("alert('쿠키가 없습니다. 쿠키생성 폼으로 이동합니다');");
		//out.println("location.href = 'B.cookie_create_form.jsp';");
		out.println("location.replace('B.cookie_create_form.jsp');");
		out.println("</script>");
		
		return;
	}
	
	String searchCookieValue = "no data";
	for(int i = 0; i < cookies.length; i++){
		Cookie tempCookie = cookies[i];
		String tempCookieName = tempCookie.getName();
		if(tempCookieName.equals("searchCookie")){
			searchCookieValue = tempCookie.getValue();
			break;
		}
	}
	searchCookieValue = URLDecoder.decode(searchCookieValue, "UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키정보 읽기</h1>
	<hr/>
	<ol>
		<li>클라이언트가 전송한 searchCookie의 값 : <%= searchCookieValue %></li>
		<li><a href="B.cookie_delete.jsp">쿠키삭제</a></li>
		
	</ol>
</body>
</html>
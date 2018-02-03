<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(int i = 0; i< cookies.length; i++)	{
		//if(cookies[i].getName().equals("searchCookie")){
			cookies[i].setValue(""); //안써도되지만 통상 사용
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
			
		//}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>쿠키삭제</h1><hr>
<p>내안에 쿠키없다.</p>
<div><a href="B.cookie_create_form.jsp">쿠키생성폼</a></div>
<div><a href="B.cookie_read.jsp">쿠키읽기</a></div>
</body>
</html>
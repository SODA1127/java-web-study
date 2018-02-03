<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	int count = 0;
	public void jspInit(){
		System.out.println("1. jspInit()");
	}
	public void jspDestroy(){
		System.out.println("3. jspDestroy()");
	}
	
%>
<%
	System.out.println("2. service()");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body bgcolor=#40e0d0 style="font-size: 9pt; line-height: 140%;">
	<center>
		현재까지의 페이지 뷰 수 <font color=#0000FF>
		<%-- out.print(++ count); --%>
		<%= ++count %>
		</font> 번입니다
	</center>
</body>
</html>

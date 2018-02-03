<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("4.form.jsp");
		return;
	}
	/*
	1.파라메타바끼
	2.가입
	3.응답
	*/
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String[] hobbies = request.getParameterValues("hobby");
%>

<HEAD>
<TITLE>가입 정보</TITLE>
</HEAD>
<center>
	<br />
	<br />
	<br />
	<br />
	<br /> <img src="racoon.jpg">
	<h1>은 너굴맨이 처리했으니 안심하라구</h1>
	<br />
	<br />
	<table border="1" width="250px" height="250px" align="center">
		<tr>
			<td style="text-align: center" colspan="2">가입&nbsp;정보</td>
		</tr>
		<tr>
			<td style="text-align: center">ID</td>
			<td style="text-align: center"><%=id %></td>
		</tr>
		<tr>
			<td style="text-align: center">Name</td>
			<td style="text-align: center"><%=name %></td>
		</tr>
		<%for(int i=0;i<hobbies.length;i++){ %>
		<tr>
			<td style="text-align: center" >Hobby</td>
			<td style="text-align: center"><%=hobbies[i]%></td>
		</tr>
		<%} %>
		
	</table>	
		</center>
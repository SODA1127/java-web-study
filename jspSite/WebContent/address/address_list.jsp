<%@page import="com.itwill.servlet.address.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.servlet.address.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AddressDao addressDao = new AddressDao();
	ArrayList<Address> addressList = addressDao.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="com.css">
</head>
<body>
	<br>
	<p align=center>
		<font size=5 color=#0000FF>◈◈ 주소록 ◈◈</font><br>
	<table width=80% align=center border=1 cellspacing=0
		bordercolordark=white bordercolorlight=#ADADAD>
		<tr bgcolor=#000000 class=t1>
			<td align=center height=20 width=25%><font color=#FFFFFF>번호</font></td>
			<td align=center height=20 width=25%><font color=#FFFFFF>아이디</font></td>
			<td align=center height=20 width=40%><font color=#FFFFFF>이름</font></td>
			<td align=center height=20 width=10%><font color=#FFFFFF>삭제</font></td>
		</tr>
		<%
			for (int i = 0; i < addressList.size(); i++) {
				Address tempAddress = addressList.get(i);
		%>
		<tr class=t1>
			<td align=center width=25% height=20><%=tempAddress.getNo()%></td>
			<td align=center width=25% height=20><a href='address_detail.jsp?no=<%=tempAddress.getNo()%>'><%=tempAddress.getId()%></a></td>
			<td align=center width=40% height=20><%=tempAddress.getName()%></td>
			<td align=center width=10% height=20><a href = 'address_delete.jsp?no=<%=tempAddress.getNo()%>'>삭제</a></td>
		</tr>
		<%
			}
		%>

	</table>
	<div>
		<a href='address_insert_form.jsp'>주소록쓰기폼</a>
	</div>
</body>
</html>

<%@page import="com.itwill.servlet.address.Address"%>
<%@page import="com.itwill.servlet.address.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>세부사항</title>
</head>
<body>
	<%
		AddressDao addressDao = new AddressDao();
		String no = request.getParameter("no");
		Address address = addressDao.selectByNo(Integer.parseInt(no));
		System.out.println(address);
	%>
	<h1><%=address.getName()%>님 주소록 상세보기
	</h1>
	<hr />
	<ul>
		<li><%=address.getNo()%></li>
		<li><%=address.getName()%></li>
		<li><%=address.getId()%></li>
		<li><%=address.getPhone()%></li>
		<li><%=address.getAddress()%></li>
	</ul>
	<hr>
	<a href='address_insert_form.jsp'>주소록쓰기폼</a>
	<a href='address_delete_action.jsp?no=<%=address.getNo()%>'>삭제</a>
	<a href='address_update_form.jsp?no=<%=address.getNo()%>'>수정폼</a>
	<a href='address_list.jsp'>주소록리스트</a>
</body>
</html>
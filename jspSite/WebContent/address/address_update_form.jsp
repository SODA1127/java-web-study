<%@page import="com.itwill.servlet.address.Address"%>
<%@page import="com.itwill.servlet.address.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
</head>
<body>
<%
		AddressDao addressDao = new AddressDao();
		String no = request.getParameter("no");
		Address address = addressDao.selectByNo(Integer.parseInt(no));
	%>
	<h1>김경호 회원수정폼</h1>
	<form action="address_update_action.jsp" method="post">
		번호:<input type="text" name="no" value="<%= address.getNo() %>" readonly="readonly"><br/>
		아이디:<input type="text" name="id" value="<%= address.getId() %>"><br/>
		이름:<input type="text" name="name" value="<%= address.getName() %>"><br/>
		전화번호:<input type="text" name="phone" value="<%= address.getPhone() %>"><br/>
		주소:<input type="text" name="address" value="<%= address.getAddress() %>"><br/>
		<input type="submit" value="수정완료">
		<input type="reset" value="취소">
	</form>
	<div>
		<a href='address_list.jsp'>주소록리스트</a>
		<a href='address_insert_form.jsp'>주소록쓰기폼</a>
	</div>
	
</body>
</html>
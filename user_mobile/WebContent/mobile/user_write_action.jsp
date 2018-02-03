<?xml version="1.0" encoding="EUC-KR"?>
<%@page import="com.itwill.user.ExistedUserException"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/xml;charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	System.out.println(request.getRemoteAddr()+"���� user_write_action.jsp ��û");
	int status = 0;
	String msg=""; 
	if(request.getMethod().equalsIgnoreCase("GET")){
		status = 2;
		msg="�߸��� ��û�Դϴ�[GET].";
	}else{
		//request.setCharacterEncoding("EUC-KR");
		//1.�Ķ��Ÿ�ޱ�
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User user = new User(userId, password, name, email);
		//2.��������
		try {
			int result = UserService.getInstance().create(user);
			status=0;
			msg="ȸ�����Լ��� �α���ȭ�麸���ٲ���!!";
		} catch (ExistedUserException e) {
			status=1;
			msg=e.getMessage();
		} catch (Exception e) {
			status=99;
			msg=e.getMessage();
		}
	}
%>
<result>
	<status><%=status %></status>
	<msg><%=msg %></msg>
	<data>
		<userList></userList>
	</data>
</result>











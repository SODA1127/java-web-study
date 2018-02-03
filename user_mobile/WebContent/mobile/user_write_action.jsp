<?xml version="1.0" encoding="EUC-KR"?>
<%@page import="com.itwill.user.ExistedUserException"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/xml;charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	System.out.println(request.getRemoteAddr()+"님이 user_write_action.jsp 요청");
	int status = 0;
	String msg=""; 
	if(request.getMethod().equalsIgnoreCase("GET")){
		status = 2;
		msg="잘못된 요청입니다[GET].";
	}else{
		//request.setCharacterEncoding("EUC-KR");
		//1.파라메타받기
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User user = new User(userId, password, name, email);
		//2.업무실행
		try {
			int result = UserService.getInstance().create(user);
			status=0;
			msg="회원가입성공 로그인화면보여줄께요!!";
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











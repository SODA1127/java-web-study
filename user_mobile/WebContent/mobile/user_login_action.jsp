<?xml version="1.0" encoding="EUC-KR"?>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@page import="com.itwill.user.UserService"%>
<%@page language="java" contentType="text/xml; charset=EUC-KR"
    	pageEncoding="EUC-KR"%>
<%
	System.out.println(request.getRemoteAddr()+" ���� user_login_action.jsp ��û");
	int status=0;
	String msg="";
	if(request.getMethod().equalsIgnoreCase("GET")){
		status=99;
		msg="GET ��û�Դϴ�. ��������!!";
	}else{
	
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		try{
			User sUser=UserService.getInstance().login(userId,password);
			//login������ ���ǿ� ���̵�(User��ü)����
			session.setAttribute("sUserId", userId);
			session.setAttribute("sUser", sUser);
			status=0;
			msg=userId+" �Էα��� ���� ����Ʈȭ������ �̵�";
		}catch(UserNotFoundException e){
			status=1;
			msg=e.getMessage();
		}catch(PasswordMismatchException e){
			status=2;
			msg=e.getMessage();
		}catch(Exception e){
			status=99;
			msg=e.getMessage();
		}
	}
%>
<result>
	<status><%=status%></status>
	<msg><%=msg %></msg>
	<data>
		<userList></userList>
	</data>
</result>
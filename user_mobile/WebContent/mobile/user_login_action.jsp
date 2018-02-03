<?xml version="1.0" encoding="EUC-KR"?>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@page import="com.itwill.user.UserService"%>
<%@page language="java" contentType="text/xml; charset=EUC-KR"
    	pageEncoding="EUC-KR"%>
<%
	System.out.println(request.getRemoteAddr()+" 님이 user_login_action.jsp 요청");
	int status=0;
	String msg="";
	if(request.getMethod().equalsIgnoreCase("GET")){
		status=99;
		msg="GET 요청입니다. 누구세요!!";
	}else{
	
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		try{
			User sUser=UserService.getInstance().login(userId,password);
			//login성공시 세션에 아이디(User객체)저장
			session.setAttribute("sUserId", userId);
			session.setAttribute("sUser", sUser);
			status=0;
			msg=userId+" 님로그인 성공 리스트화면으로 이동";
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
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login.jsp");
		return;
	}
	
	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	try{
		User sUser=UserService.getInstance().login(userId,password);
		//login성공시 세션에 아이디(User객체)저장
		session.setAttribute("sUserId", userId);
		session.setAttribute("sUser", sUser);
		response.sendRedirect("user_list.jsp");
	}catch(UserNotFoundException e){
		/*
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_login.jsp';");
		out.println("</script>");
		*/
		User fuser=new User(userId,password,"","");
		request.setAttribute("MSG1", e.getMessage());
		request.setAttribute("fuser", fuser);
		RequestDispatcher rd=request.getRequestDispatcher("user_login.jsp");
		rd.forward(request, response);
		
	}catch(PasswordMismatchException e){
		/*
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_login.jsp';");
		out.println("</script>");
		*/
		User fuser=new User(userId,password,"","");
		request.setAttribute("MSG2", e.getMessage());
		request.setAttribute("fuser", fuser);
		RequestDispatcher rd=request.getRequestDispatcher("user_login.jsp");
		rd.forward(request, response);
	}catch(Exception e){
		response.sendRedirect("error/error.jsp");
	}
%>
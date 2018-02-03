
<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_form.jsp");
		return;
	}	
	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	
	try{
		User loginUser=UserService.getInstance().login(userId,password);
		//�α��μ���
		session.setAttribute("sUserId", userId);
		session.setAttribute("sUser", loginUser);
		response.sendRedirect("shop_main.jsp");
		
	}catch(UserNotFoundException e){
		//���̵��������
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_login_form.jsp';");
		out.println("</script>");
	}catch(PasswordMismatchException e){
		//�о��������ġ
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_login_form.jsp';");
		out.println("</script>");
	}catch(Exception e){
		response.sendRedirect("error/user_error.jsp");
	}
%>
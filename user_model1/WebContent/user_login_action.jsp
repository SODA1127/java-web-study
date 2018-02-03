<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.exception.PasswordMismatchException"%>
<%@page import="com.itwill.user.exception.UserNotFoundException"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("user_main.jsp");
		return;
	}
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	UserService userService = new UserService();
	try {
		User loginUser = userService.login(userId, password);
		session.setAttribute("sUserId", loginUser.getUserId());
		session.setAttribute("sUser", loginUser);
		response.sendRedirect("user_main.jsp");
	} catch (UserNotFoundException e) {
		/*out.println("<script>");
		out.println("alert('" + e.getMessage() + "');");
		out.println("location.href='user_login_form.jsp';");
		out.println("</script>");*/
		request.setAttribute("IDMSG", e.getMessage());
		request.setAttribute("fUserId", userId);
		%>
		<jsp:forward page="user_login_form.jsp"></jsp:forward>
		<%
		return;
	} catch (PasswordMismatchException e) {
		/*out.println("<script>");
		out.println("alert('" + e.getMessage() + "');");
		out.println("location.href='user_login_form.jsp';");
		out.println("</script>");*/
		request.setAttribute("PWMSG", e.getMessage());
		request.setAttribute("fUserId", userId);
		request.setAttribute("fUserPw", password);
		%>
		<jsp:forward page="user_login_form.jsp"></jsp:forward>
		<%
		return;
	} catch (Exception e) {
		response.sendRedirect("user_error.jsp");
	}
%>
<%@page import="com.itwill.user.exception.ExistedUserException"%>
<%@page import="com.itwill.user.User"%>
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
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	System.out.println(userId + ", " + password + ", " + name + ", " + email);

	UserService userService = new UserService();
	User user = new User(userId, password, name, email);
	try {
		userService.create(user);
		response.sendRedirect("user_login_form.jsp");
		return;
	} catch (ExistedUserException e) {
		/*out.println("<script>");
		out.println("alert('" + e.getMessage() + "')");
		out.println("location.href='user_write_form.jsp';");
		out.println("</script>");*/
		request.setAttribute("MSG", e.getMessage());
		request.setAttribute("fUser", user);
		%>
			<jsp:forward page="user_write_form.jsp"></jsp:forward>
		<%
		return;

	} catch (Exception e) {
		response.sendRedirect("user_error.jsp");
		e.printStackTrace();
	}
%>
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

	UserService userService = new UserService();
	try {
		String sUserId = (String)session.getAttribute("sUserId");
		if(userId.equals(sUserId)){
			session.invalidate();
			userService.remove(userId);
			out.println("<script>");
			out.println("alert('회원님께서는 계정을 탈퇴하셨습니다.')");
			out.println("location.href='user_login_form.jsp';");
			out.println("</script>");
			return;
		}		
		else if(!userId.equals(sUserId)){
			out.println("<script>");
			out.println("alert('본인만이 계정 탈퇴 가능합니다.')");
			out.println("location.href='user_view.jsp?userId=" + userId + "';");
			out.println("</script>");
			return;
		}
		response.sendRedirect("user_list.jsp");
		return;
	} catch (ExistedUserException e) {
		out.println("<script>");
		out.println("alert('" + e.getMessage() + "')");
		out.println("location.href='user_write_form.jsp';");
		out.println("</script>");
		
		
	} catch (Exception e) {
		response.sendRedirect("user_error.jsp");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>asdf</title>
</head>
<body>

</body>
</html>
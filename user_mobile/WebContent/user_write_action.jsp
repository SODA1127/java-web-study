<%@page import="com.itwill.user.ExistedUserException"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_write.jsp");
		return;
	}
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
		response.sendRedirect("user_login.jsp");
	} catch (ExistedUserException e) {
		/***************case1****************
		response.sendRedirect("user_write.jsp");
		**************************************/
		/*************case2*******************
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_write.jsp';");
		out.println("</script>");
		*************************************/
		
		request.setAttribute("MSG", e.getMessage());
		request.setAttribute("fuser", user);
		RequestDispatcher rd=request.getRequestDispatcher("user_write.jsp");
		rd.forward(request, response);
		return;
	} catch (Exception e) {
		response.sendRedirect("error/error.jsp");
		e.printStackTrace();
	}
	//3.응답(로그인페이지로 리다이렉션)
%>












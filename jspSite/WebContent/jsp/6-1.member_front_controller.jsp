<%--
front controller 
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1.클라이언트요청구분
		  - /6-1.member_front_controller.jsp?cmd=member_list
		  - /6-1.member_front_controller.jsp?cmd=member_login
		  - /6-1.member_front_controller.jsp?cmd=member_detail
	*/
		
	String cmd=request.getParameter("cmd");
	if(cmd==null){
		response.sendRedirect("6-1.member_menu.jsp");
		return;
	}
	
	/*
		2. 클라이언트 요청에 따른 업무실행
		
	*/
	String forwardPath="";
	if(cmd.equals("member_list")){
		//MemberDao객체를 사용해서 ArrayList객체를 얻는다.
		ArrayList<String> memberList=new ArrayList<String>();
		memberList.add("이효리");
		memberList.add("신명숙");
		memberList.add("최경녀");
		memberList.add("김은희");
		
		/*
			2-1. 클라이언트 요청에 따른 업무실행 후
			데이터를 요청 객체에 붙여준다.
		*/
		request.setAttribute("memberList", memberList);
		forwardPath="6-1.member_list.jsp";
		
	}else if(cmd.equals("member_login")){
		
		forwardPath="6-1.member_login.jsp";
		
	}else if(cmd.equals("member_detail")){
		//MemberDao객체를 사용해서 MemberDto 객체를 얻는다.
		forwardPath="6-1.member_detail.jsp";
		request.setAttribute("member", "김은희");
	}else{
		forwardPath="error.jsp";
	}
	
	/*
		3. 요청에 따른 결과를 보여줄 JSP로 foward
	*/
%>
<jsp:forward page="<%=forwardPath%>"/>

<%-- 
<jsp:forward page="${forwardPath}"/>
 --%>
 
 
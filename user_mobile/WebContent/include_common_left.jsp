<%@page import="com.itwill.user.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>			
<p>
	<strong>메 뉴</strong>
</p>
<ul>
	<%
	if(session.getAttribute("sUserId")!=null){
		User sUser=(User)session.getAttribute("sUser");
	%>
		<li>
		<a href="user_myInfo_view.jsp"><%=session.getAttribute("sUserId")%>님</a>&nbsp;
		<a href="user_logout_action.jsp">로그아웃</a>
		</li>
		<li><a href="mailto:<%=sUser.getEmail()%>"><%=sUser.getEmail()%></a></li>
	<%}else{%>	
		<li><a href="user_login.jsp">로그인</a></li>
	<%}%>	
		<li><a></a></li>
		<li><a href="guest_list.jsp">방명록</a></li>
		<li><a href="shop_product_list.jsp">쇼핑몰</a></li>
		<li><a href="user_list.jsp">회원관리</a></li>
		<li><a href="board_list.jsp">게시판</a></li>
</ul>
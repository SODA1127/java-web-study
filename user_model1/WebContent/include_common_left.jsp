<%@page import="com.itwill.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<p>
	<strong>메 뉴</strong>
</p>
<ul>
		<%
				String sUserId = (String)session.getAttribute("sUserId");
				if(sUserId != null){
					User sUser=(User)session.getAttribute("sUser");
		%>
					<li><a href="user_view.jsp?userId=<%= sUserId%>"><%= sUser.getName() %>님</a>&nbsp;<a href="user_logout_action.jsp">로그아웃</a></li>
					<li><a></a></li>
		<%} else {%>
					<li><a href="user_login_form.jsp">로그인</a></li>
					<li><a href="user_write_form.jsp">회원가입</a></li>
		<%}%>
		<li><a></a></li>
		
		<li><a href="user_list.jsp">회원리스트</a></li>
	

</ul>
<script type="text/javascript">
	function userLogin(){
		alert('로그인 하세요!!')
		location.href='user_login_form.jsp';
	}
</script>    


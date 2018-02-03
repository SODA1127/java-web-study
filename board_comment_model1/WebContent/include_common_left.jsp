<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>
	<strong>메 뉴</strong>
</p>
<ul>
		<%
		String sUserId=(String)session.getAttribute("sUserId");
		if(sUserId!=null){
		%>
	    	<li><a href=""><%=sUserId%>님</a>&nbsp;<a href="user_logout_action.jsp">로그아웃</a></li>
	    <%}else{ %>
			<li><a href="user_login.jsp">로그인</a></li>
		<%} %>
		<li><a></a></li>
		<li><a href="guest_list.jsp">방명록</a></li>
		<li><a href="shop_product_list.jsp">쇼핑몰</a></li>
		<li><a href="javascript:userLogin();">회원관리</a></li>
		<li><a href="board_list.jsp">게시판</a></li>
</ul>
<script type="text/javascript">
	function userLogin(){
		alert('로그인 하세요!!')
		location.href='user_login.jsp';
	}
</script>    


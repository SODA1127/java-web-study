<%@page import="com.itwill.user.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>			
<p>
	<strong>�� ��</strong>
</p>
<ul>
	<%
	if(session.getAttribute("sUserId")!=null){
		User sUser=(User)session.getAttribute("sUser");
	%>
		<li>
		<a href="user_myInfo_view.jsp"><%=session.getAttribute("sUserId")%>��</a>&nbsp;
		<a href="user_logout_action.jsp">�α׾ƿ�</a>
		</li>
		<li><a href="mailto:<%=sUser.getEmail()%>"><%=sUser.getEmail()%></a></li>
	<%}else{%>	
		<li><a href="user_login.jsp">�α���</a></li>
	<%}%>	
		<li><a></a></li>
		<li><a href="guest_list.jsp">����</a></li>
		<li><a href="shop_product_list.jsp">���θ�</a></li>
		<li><a href="user_list.jsp">ȸ������</a></li>
		<li><a href="board_list.jsp">�Խ���</a></li>
</ul>
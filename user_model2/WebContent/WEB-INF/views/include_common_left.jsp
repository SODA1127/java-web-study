<%@page import="com.itwill.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="com/itwill/user/user" />
<p>
	<strong><fmt:message key="menu.menu" /></strong>
</p>
<ul>
		<c:if test="${!empty sUserId}">
					<li><a href="user_view.do?userId=${sUserId}">${sUser.userId}</a>&nbsp;<a href="user_logout_action.do"><fmt:message key="menu.logout" /></a></li>
					<li><a></a></li>
		</c:if>
		<c:if test="${empty sUserId}">
					<li><a href="user_login_form.do"><fmt:message key="menu.login" /></a></li>
					<li><a href="user_write_form.do"><fmt:message key="menu.write"/></a></li>
		</c:if>
		<li><a></a></li>
		
		<li><a href="user_list.do"><fmt:message key="menu.list"/></a></li>
	

</ul>
<fmt:message key="user.login.message" var="login_mesage"/>
<script type="text/javascript">
	function userLogin(){
		alert('${login_mesage}')
		location.href='user_login_form.do';
	}
</script>    


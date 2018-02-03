<%@page import="com.itwill.user.User"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="com/itwill/user/user" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><fmt:message key="page.list.header" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">

<script type="text/javascript">
	function userList() {
		f.action = "user_write_form.do";
		f.submit();
	}
</script>

<style type="text/css" media="screen">
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>
									<fmt:message key="page.list.header" />
									</b></td>
								</tr>
							</table>

							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>
										<td align=center bgcolor="E6ECDE" height="22"><fmt:message key="user.id" /></td>
										<td align=center bgcolor="E6ECDE"><fmt:message key="user.name" /></td>
										<td align=center bgcolor="E6ECDE"><fmt:message key="user.email" /></td>
									</tr>
									<c:forEach var="user" items="${userList}">
										<tr>
											<td width=190 align=center bgcolor="ffffff" height="20">
												${user.userId}</td>
											<td width=200 bgcolor="ffffff" style="padding-left: 10">
												<c:if test="${! sUserId.equals(user.userId)}">
													<a href="user_view.do?userId=${user.userId}" class="user">${user.name} </a>
												</c:if>
												<c:if test="${sUserId.equals(user.userId)}">
													${user.name}
												</c:if>
											</td>
											<td width=200 align=center bgcolor="ffffff">
												${user.email}</td>
										</tr>
									</c:forEach>


								</table>
							</form> <br /> <!-- table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align="right"><input type="button" value="사용자 추가"  onclick="userList();"/>
									</td>
								</tr>
							</table --></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
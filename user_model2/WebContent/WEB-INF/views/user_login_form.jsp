<%@page import="com.itwill.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="com/itwill/user/user" />
<%
	String IDMSG = (String) request.getAttribute("IDMSG");
	String PWMSG = (String) request.getAttribute("PWMSG");

	String fUserId = (String) request.getAttribute("fUserId");
	String fUserPw = (String) request.getAttribute("fUserPw");

	if (IDMSG == null) {
		IDMSG = "";
	}if (PWMSG == null) {
		PWMSG = "";
	}

	if (fUserId == null) {
		fUserId = "";
	}
	if (fUserPw == null) {
		fUserPw = "";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<fmt:message key="input.userId" var="userId"/>
<fmt:message key="input.password" var="password"/>

<script type="text/javascript">
	function userCreate() {
		f.action = "user_write_form.do";
		f.submit();
	}

	function login() {
		if (f.userId.value == "") {
			alert("${userId}");
			f.userId.focus();
			return false;
		}
		if (f.password.value == "") {
			alert("${password}");
			f.password.focus();
			return false;
		}

		f.action = "user_login_action.do";
		f.submit();
	}
</script>
<title><fmt:message key="page.login.header" /></title>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b> <fmt:message key="page.login.header" /> </b></td>
								</tr>
							</table> <!-- login Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22"><fmt:message key="user.id" /></td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="userId" value="<%=fUserId%>">&nbsp;&nbsp;<font
											color="red"><%=IDMSG%></font></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22"><fmt:message key="user.password" /></td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="password"
											style="width: 150" name="password" value="<%=fUserPw%>">&nbsp;&nbsp;<font
											color="red"><%=PWMSG%></font></td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<fmt:message key="button.login" var="login"/>
									<fmt:message key="button.create" var="create"/>
									
									<td align=center><input type="button" value="${login}"
										onClick="login();"> &nbsp; <input type="button"
										value="${create}" onClick="userCreate()"></td>
								</tr>
							</table></td>
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
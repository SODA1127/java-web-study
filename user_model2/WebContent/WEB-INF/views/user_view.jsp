<%@page import="com.itwill.user.exception.UserNotFoundException"%>
<%@page import="com.itwill.user.User"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="com/itwill/user/user" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><fmt:message key="page.view.header" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<script type="text/javascript">
	function userList() {
		f.action = "user_list.do";
		f.submit();
	}

	function userModify() {
		f.action = "user_modify_form.do";
		f.method = "POST";
		f.submit();
	}

	function userRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			f.action = "user_remove_action.do";
			f.submit();
		}
	}
</script>
<c:if test="${!userId.equals(findUser.userId)}">
		<script>
			alert('${IDMSG}');
			location.href='user_list.do';
		</script>
</c:if>

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
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><fmt:message key="page.view.header" /></b></td>
								</tr>
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<input type="hidden" name="userId"
									value="${userId}" />
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22"><fmt:message key="user.id" /></td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											${findUser.userId}
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22"><fmt:message key="user.name" /></td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											${findUser.name}
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22"><fmt:message key="user.email" /></td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											${findUser.email}
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<fmt:message key="button.modify" var="modify"/>
									<fmt:message key="button.list" var="list"/>
									<fmt:message key="button.remove" var="remove"/>
									<c:if test="${sUserId.equals(userId)}">
										<input type="button" value="${modify}" onClick="userModify()"> &nbsp; 
										<input type="button" value="${remove}" onClick="userRemove()"> &nbsp; 
									</c:if>
										<input type="button" value="${list}" onClick="userList()"></td>
								</tr>
							</table>
						</td>
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
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="loginCheck.jspf"%>
<%
	/*
	1.�α����ѻ����������
	*/
	User sUser=(User)session.getAttribute("sUser");
	/*
	User sUser=null;
		try {
			 sUser = UserService.getInstance().findUser(sUserId);
		} catch (UserNotFoundException e) {
			out.println("<script>");
			out.println("alert('"+e.getMessage()+"');");
			out.println("location.href='user_list.jsp';");
			out.println("</script>");
			return;
		} catch (Exception e) {
			response.sendRedirect("error/error.jsp");
		}
	*/
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<script type="text/javascript">
	function userList() {
		f.action = "user_list.jsp";
		f.submit();
	}

	function userModify() {
		f.action = "user_myInfo_modify.jsp";
		f.submit();
	}

	function userRemove() {
		if (confirm("���� �����Ͻðڽ��ϱ�?")) {
			f.action = "user_myInfo_remove_action.jsp";
			f.submit();
		}
	}
</script>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>����� ����
											- ����� ��������</b></td>
								</tr>
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">�����
											���̵�</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=sUser.getUserId()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">�̸�</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=sUser.getName()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">�̸���
											�ּ�</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=sUser.getEmail()%></td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="����" onClick="userModify()"> &nbsp; 
									<input type="button" value="����" onClick="userRemove()"> &nbsp; 
									<input	type="button" value="���" onClick="userList()">
									</td>
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
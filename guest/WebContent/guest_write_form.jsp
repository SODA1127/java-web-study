<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>방명록 관리</title>
<meta http-equiv="Content-Type" content="UTF-8">

<link rel="stylesheet"
	href="css/styles.css">
<link rel="stylesheet"
	href="css/guest.css">


<script	src="js/guest.js" charset="UTF-8"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper content start -->
		<div id="wrapper">
			
<div id="content">
	<table width=0 border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td>
				<!--contents--> <br />
				<table style="padding-left: 10px" border=0 cellpadding=0
					cellspacing=0>
					<tr>
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
								방명록 쓰기</b></td>
					</tr>
				</table> <!-- guest write Form  -->
				<form name="f" method="post">
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
							<td width=490 align="left" bgcolor="ffffff"
								style="padding-left: 10px"><input type="text"
								style="width: 150" name="guest_name"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">이메일</td>
							<td width=490 align="left" bgcolor="ffffff"
								style="padding-left: 10px"><input type="text"
								style="width: 150" name="guest_email"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">홈페이지</td>
							<td width=490 align="left" bgcolor="ffffff"
								style="padding-left: 10px"><input type="text"
								style="width: 150" name="guest_homepage"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">타이틀</td>
							<td width=490 align="left" bgcolor="ffffff"
								style="padding-left: 10px"><input type="text"
								style="width: 240" name="guest_title"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
							<td width=490 align="left" bgcolor="ffffff"
								style="padding-left: 10px">
								<textarea wrap="soft" style="width:240px" rows="10" name="guest_content"></textarea>
							</td>
						</tr>
					</table>
				</form> <br />
				<table width=590 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td align=center><input type="button" value="방명록쓰기"
							onClick="guestCreate();"> &nbsp; <input type="button"
							value="방명록목록" onClick="guestList()"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

		</div>
		<!-- wrapper content end-->
		<!-- footer start-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
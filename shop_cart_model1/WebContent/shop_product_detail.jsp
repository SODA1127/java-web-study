<%@page import="com.itwill.shop.product.DogProduct"%>
<%@page import="com.itwill.shop.product.DogProductService"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	if (id == null) {
		response.sendRedirect("shop_product_list.jsp");
		return;
	}
	DogProductService dogManager = new DogProductService();
	DogProduct dog = dogManager.getDog(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>쇼핑몰</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function buy() {
		if (<%=session.getAttribute("sUserId") == null%>) {
			alert('로그인 하세요');
			location.href = 'user_login.jsp';
		} else {
			location.href = 'shop_buy.jsp';
		}
	}
	function productList() {
		location.href = 'shop_product_list.jsp';
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
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
											상품상세보기</b></td>
								</tr>
							</table> <!-- 
							<form name="f" method="post">
							-->
							<table style="margin-left: 10px" border=0 width=80% height=376
								align=center>
								<tr valign=bottom>
									<td width=30% align=center class=t1><font size=2
										color=#0000FF><b>주문량</b></font></td>
									<td width=40% align=center class=t1><font size=2
										color=#0000FF><b>멍멍이 이름</b></font></td>
									<td width=30% align=center class=t1><font size=2
										color=#0000FF><b>멍멍이 소개</b></font></td>
								</tr>
								<tr width=100%>
									<td colspan=3 height=5><hr color=#556b2f></td>
								</tr>
								<tr width=100%>
									<td width=30% height=200 align=center class=t1>
										<form method="post" action="shop_add_cart.jsp">
											수량 : <input type=text name=qty value=1 size=4 class=TXTFLD>
											마리 <br /> <br /> <input type=submit value=장바구니에담기
												class=TXTFLD /> <input type="hidden" name=id
												value=<%=dog.getId()%>>
										</form>
									</td>
									<td width=40% height=200 align=center><img border=0
										src=image/<%=dog.getImage()%> width=120 height=200></td>
									<td width=30% height=200 class=t1>
										<ol type="disc">
											<li><b>견종 : bigle&nbsp;&nbsp;&nbsp;</b></li>
											<li><font color=#FF0000>가격 :
													550000&nbsp;&nbsp;&nbsp;</font></li>
											<li><font color=#0000FF>기타 상세 정보..&nbsp;&nbsp</font></li>
										</ol>
									</td>
								</tr>
								<tr>
									<td colSpan=3 height=21><hr color=#556b2f></td>
								</tr>
							</table> <!-- 
							</form>
							-->
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center><input type="button" value="구매"
										onClick="buy()"> &nbsp; <input type="button"
										value="계속쇼핑" onClick="productList();"></td>
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
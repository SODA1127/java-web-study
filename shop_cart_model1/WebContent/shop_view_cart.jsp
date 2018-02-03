<%@page import="com.itwill.shop.cart.ShoppingCartItem"%>
<%@page import="com.itwill.shop.cart.ShoppingCartService"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>



<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" session="true"%>
	
<%
	ShoppingCartService cart = (ShoppingCartService)session.getAttribute("cart");
	if (cart == null) {
		//response.sendRedirect("shop_product_list.jsp");
		//return;
		cart=new ShoppingCartService();
		session.setAttribute("cart", cart);
	}
	
	
	Collection<ShoppingCartItem> cartItems = cart.getItems();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>쇼핑몰 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function buy(){
		if(<%=session.getAttribute("sUserId")==null%>){
			alert('로그인 하세요');
			location.href='user_login_form.jsp';
		}else{
			location.href='shop_buy.jsp'; 
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
											장바구니 보기</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post" >
								<table align=center border=1 width=80% cellspacing=0
									bordercolordark=#FFFFFF bordercolorlight=#4682b4>
									<tr>
										<td width=80 height=25 bgcolor=#4682b4 align=center class=t1><font
											color=#FFFFFF></font></td>
										<td width=210 height=25 bgcolor=#4682b4 align=center class=t1><font
											color=#FFFFFF>강아지 이름</font></td>
										<td width=112 height=25 bgcolor=#4682b4 align=center class=t1><font
											color=#FFFFFF>수 량</font></td>
										<td width=166 height=25 bgcolor=#4682b4 align=center class=t1><font
											color=#FFFFFF>가 격</font></td>
										<td width=50 height=25 bgcolor=#4682b4 align=center class=t1><font
											color=#FFFFFF>비 고</font></td>
									</tr>
									<%
										
										//cart.items.keySet().iterator();
										//application.log(">>>>"+cartItems.getClass().getSimpleName());
										Iterator<ShoppingCartItem> cartItemsIter = cartItems.iterator();
										
										while (cartItemsIter.hasNext()) {
											ShoppingCartItem cartItem = cartItemsIter.next();
									%>		
									<!-- cart item start -->
									<tr>
										<td width=80 height=40 align=center class=t1><a href='shop_product_detail.jsp?id=<%=cartItem.getDogProductItem().getId()%>'><img width="40" height="40" src='image/<%=cartItem.getDogProductItem().getImage() %>'/></a></td>
										<td width=210 height=26 align=center class=t1><%=cartItem.getDogProductItem().getName() %></td>
										<td width=112 height=26 align=center class=t1><%=cartItem.getQuantity() %></td>
										<td width=166 height=26 align=center class=t1><%=cartItem.getTot()%></td>
										<td width=50 height=26 align=center class=t1><a
											href=shop_delete_item_cart.jsp?id=<%=cartItem.getDogProductItem().getId()%> class=m1>삭제</a></td>
									</tr>
									<!-- cart item end -->
									<%
										}
									%>
									<%if(cartItems.size()>0){ %>
									<tr>
										<td width=640 colspan=5 height=26 class=t1>
											<p align=right>
												<font color=#FF0000>총 금액 : <%=cart.getTotal()%> 원
												</font>
											</p>
										</td>
									</tr>
									<%}else{ %>
									<tr>
										<td width=640 colspan=4 height=26 class=t1>
											<p align=right>
												<font color=#FF0000>장바구니가 비어있어요
												</font>
											</p>
										</td>
									</tr>
									
									
									<%} %>
									
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;<a href=shop_delete_cart.jsp
										class=m1>장바구니 비우기</a>&nbsp;&nbsp;<a
										href=shop_product_list.jsp class=m1>계속 구경하기</a>
										&nbsp;&nbsp;<a
										href="javascript:buy();" class=m1>구매하기</a>

									</td>
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
				<jsp:include page="include_common_bottom.jsp"/>
			    <!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
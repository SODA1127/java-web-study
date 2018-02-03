<%@page import="com.itwill.shop.cart.ShoppingCartService"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//장바구니에 있는 모든개를지우고  view_cart.jsp 로 redirection...
	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	if (cart == null) {
		response.sendRedirect("shop_product_list.jsp");
		return;
	}
	cart.clear();
	response.sendRedirect("shop_view_cart.jsp");
%>
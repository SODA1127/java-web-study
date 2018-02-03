<%@page import="com.itwill.shop.cart.ShoppingCartService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//장바구니에서 원하는 품목을 삭제시킨 후 view_cart.jsp 로 sendRedirect 시킨다..
	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	if (cart == null) {
		response.sendRedirect("shop_product_list.jsp");
		return;

	}
	String id = request.getParameter("id");
	if (id == null || id.equals("")) {
		response.sendRedirect("shop_product_list.jsp");
		return;
	}
	cart.remove(id);
	response.sendRedirect("shop_view_cart.jsp");
%>

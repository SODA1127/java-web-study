<%@page import="com.itwill.shop.cart.ShoppingCartService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//��ٱ��Ͽ��� ���ϴ� ǰ���� ������Ų �� view_cart.jsp �� sendRedirect ��Ų��..
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

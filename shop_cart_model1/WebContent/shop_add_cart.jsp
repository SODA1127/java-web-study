
<%@page import="com.itwill.shop.product.DogProduct"%>
<%@page import="com.itwill.shop.product.DogProductService"%>
<%@page import="com.itwill.shop.cart.ShoppingCartService"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	if (request.getMethod().equalsIgnoreCase("get")) {
		response.sendRedirect("shop_product_list.jsp");
		return;
	}

	//장바구니에 개를담고 view_cart.jsp 로 redirection...

	String id = request.getParameter("id");
	String qty = request.getParameter("qty");
	if (id == null || qty == null) {
		response.sendRedirect("shop_product_list.jsp");
		return;
	}

	DogProductService dogManager = new DogProductService();
	DogProduct dogProduct = dogManager.getDog(id);

	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	if (cart == null) {
		cart = new ShoppingCartService();
	}
	cart.add(id, dogProduct, Integer.parseInt(qty));
	session.setAttribute("cart", cart);
	response.sendRedirect("shop_view_cart.jsp");
%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<p>
	<strong>�� ��</strong>
</p>
<ul>
	<%if(session.getAttribute("sUserId")==null){ %>
		<li><a href="user_login_form.jsp">�α���</a></li>
		<li><a></a></li>
		<li><a href="shop_view_cart.jsp">��ٱ���</a></li>
		<li><a href="shop_product_list.jsp">���θ�</a></li>
		<li><a href="board_list.jsp">�Խ���</a></li>
	<%}else{ %>
		<li><a href=""><%=session.getAttribute("sUserId")%>��</a>&nbsp;<a href="user_logout_action.jsp">�α׾ƿ�</a></li>
		<li><a></a></li>
		<li><a href="shop_view_cart.jsp">��ٱ���</a></li>
		<li><a href="shop_product_list.jsp">���θ�</a></li>
		<li><a href="board_list.jsp">�Խ���</a></li>
	<%} %>

</ul>
<script type="text/javascript">
	function userLogin(){
		alert('�α��� �ϼ���!!')
		location.href='user_login.jsp';
	}
</script>    


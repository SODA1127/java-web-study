<%@ page language="java"
         contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"
         
         %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>기본객체[session(HttpSession)]</h1>
<hr/>
<ol>
	<li> &lt;%@ page session="true"%&gt; (HttpSession session=request.getSession();)</li>
	<li> &lt;%@ page session="false"%&gt;(session ref사용불가)</li>
</ol>
</body>
</html>
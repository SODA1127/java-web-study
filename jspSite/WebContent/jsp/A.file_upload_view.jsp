<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
<meta charset="UTF-8">
</head>
<body>
	<h1>upload 요청시 읽은 스트림 데이터</h1>
	<xmp>
	<%
 	InputStream in = request.getInputStream();
 	while (true) {
 		int readByte = in.read();
 		if (readByte == -1)
 			break;
 		out.print((char) readByte);
 	}
 	%>
 	</xmp>
</body>
</html>
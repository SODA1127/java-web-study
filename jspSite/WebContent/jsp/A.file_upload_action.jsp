<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
	/*
	public MultipartRequest(javax.servlet.http.HttpServletRequest request,
	            java.lang.String saveDirectory,
	            int maxPostSize,
	            java.lang.String encoding)
	     		throws java.io.IOException
	*/
	String saveDirectory = application.getRealPath("/upload");
	//이 경로는 "/Users/leekijung/Documents/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/jspSite/upload"
	
	//String saveDirectory = "/Users/leekijung/Documents/eclipse-workspace/upload";
	MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, 1024 * 1024 * 200, "UTF-8");
	/*
		MultipartRequest를 사용시에는
		request 객체로부터 parameter데이터를 얻을 수 없다.
		ex> request.getParameter("name"); --> null 반환
	*/
	String name = multipartRequest.getParameter("name");
	String fileone1 = multipartRequest.getFilesystemName("fileone");
	String filetwo1 = multipartRequest.getFilesystemName("filetwo");
	String fileone2 = multipartRequest.getOriginalFileName("fileone");
	String filetwo2 = multipartRequest.getOriginalFileName("filetwo");
%>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
<meta charset="UTF-8">
</head>
<body>
	<h1>Upload 된 파일정보</h1>
	<ol>
		<li>realPath:<%=saveDirectory %></li>
		<li>name:<%= name %></li>
		<li>fileone:<%= fileone1 %></li>
		<li>filetwo:<%= filetwo1 %></li>
		<li>fileone:<%= fileone2 %></li>
		<li>filetwo:<%= filetwo2 %></li>
	</ol>
</body>
</html>
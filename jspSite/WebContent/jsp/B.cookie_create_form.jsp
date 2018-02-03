<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    		/*
    		쿠키정보 읽어서 search 쿠키가 존재한다면
    		input box에 정보 넣어주기
    		*/
    		Cookie[] cookies = request.getCookies();
	    String searchCookieValue = "";
		for(int i = 0; i < cookies.length; i++){
			Cookie tempCookie = cookies[i];
			String tempCookieName = tempCookie.getName();
			if(tempCookieName.equals("searchCookie")){
				searchCookieValue = tempCookie.getValue();
				break;
			}
		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
//alert(document.cookie);
</script>
<body>
<h1>쿠키생성 폼</h1>
<form name="searchFrm" method="post" action="B.cookie_create.jsp">
	검색 <input type="text" name="keyword" value="<%= searchCookieValue %>">
	<input type="submit" value="검색">
	
</form>
</body>
</html>
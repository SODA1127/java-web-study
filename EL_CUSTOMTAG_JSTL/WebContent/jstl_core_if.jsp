<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("sUserId", "guard");
	Integer countInt = (Integer) session.getAttribute("count");
	int count  = 0;
	if(countInt != null){
		count = countInt.intValue();
	}
	count ++;
	session.setAttribute("count", count);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL core if tag</h1><hr/>
	<c:if test="true">
		1. 반드시 실행
	</c:if>
	<ul>
	
	<c:if test="false">
		2. 반드시 안실행
	</c:if>
	
	<c:if test="${sUserId != null}">
		3. ${sUserId}님 어서오세요.<br/>
	</c:if>
	
	<c:if test="${sUserId == null}">
		4. guest님 어서오세요.<br/>
	</c:if>
	
	
	<c:if test="${!empty sUserId}">
		5. ${sUserId}님 어서오세요.<br/>
	</c:if>
	
	<c:if test="${count >= 20}">
		6. ${count}번째 방문이네요 손님!
	</c:if>
	<ul>
	
	</ul>
</body>
</html>
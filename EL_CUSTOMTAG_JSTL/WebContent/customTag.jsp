<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sinple" uri="http://www.itwill.co.kr/jsp/simpleFunc" %>
<%
	session.setAttribute("userId", "guard");
	session.setAttribute("isLogin", true);
	session.setAttribute("married", false);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사용자 정의 태그</h1><hr/>
<sinple:hello/>
<sinple:helloAttr name="김경호"/>
<sinple:helloAttr name="장동건"/>
<sinple:helloAttr name="${userId}"/>
<sinple:helloAttr name="${cookie.JSESSIONID.name}"/>
<sinple:helloAttr name="${cookie.JSESSIONID.value}"/>
<sinple:helloAttr name="${pageContext.request.method}"/>

<br/>
<br/>
<br/>
<hr>
<sinple:if test="true">
	<h4>if 항상실행</h4>
</sinple:if>

<sinple:if test="false">
	<h4>if 항상 안실행</h4>
</sinple:if>

<sinple:if test="${isLogin}">	
	<h4>로그인[${isLogin}]</h4>
</sinple:if>

<sinple:if test="${!married}">	
	<h4>결혼하고 싶을 때 하세요</h4>
</sinple:if>

</body>
</html>
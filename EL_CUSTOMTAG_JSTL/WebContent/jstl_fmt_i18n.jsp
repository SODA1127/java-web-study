<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setAttribute("userId", "xxxx");
%>
<fmt:setLocale value="ko_KR"/>
<%--
<fmt:setLocale value="ja_JP"/>
<fmt:setLocale value="en_US"/>
 --%>
<fmt:setBundle basename="com/itwill/i18n/guest" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>INTERNATIONALIZATION[국제화] -
		${pageContext.request.locale.language}</h1>
	<hr />
	<ol>
		<li><fmt:message key="title.main" /></li>
		<li><fmt:message key="title.list" /></li>
		<li><fmt:message key="title.view" /></li>
		<li><fmt:message key="title.write" /></li>

		<fmt:message key="write.label.name" var="name" />
		<fmt:message key="write.label.email" var="email" />
		<fmt:message key="write.label.homepage" var="homepage" />
		<fmt:message key="write.label.title" var="title" />

		<li>${name }</li>
		<li>${email }</li>
		<li>${homepage }</li>
		<li>${title }</li>
		<li>
		<fmt:message key="error.msg">
			<fmt:param>${userId}</fmt:param>
		</fmt:message>
		</li>
		<li>
		<fmt:message key="nv.bc">
			<fmt:param value="${'경제'}" />
			<fmt:param value="${'증권'}" />
		</fmt:message>
		</li>
	</ol>
</body>
</html>
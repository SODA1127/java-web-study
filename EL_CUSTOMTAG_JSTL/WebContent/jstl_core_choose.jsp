<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL core choose tag</h1>
	<hr />
	<c:if test="${! empty param.level}">
		<c:choose>
			<c:when test="${param.level == '1'}">초보시군요 : ${param.level}</c:when>
			<c:when test="${param.level == '2'}">약간 초보시군요 : ${param.level}</c:when>
			<c:when test="${param.level == '3'}">좀 하시는군요 : ${param.level}</c:when>
			<c:when test="${(param.level > '3') && (param.level <= '5')}">잘 하시는군요! : ${param.level}</c:when>
			<c:otherwise>레벨은 1~5 사이의 정수입니다</c:otherwise>
		</c:choose>
	</c:if>
	
	<c:if test="${empty param.level}">
		<a href="jstl_core_choose_form.jsp">레벨을 먼저 입력하세요</a>
	</c:if>
	
</body>
</html>
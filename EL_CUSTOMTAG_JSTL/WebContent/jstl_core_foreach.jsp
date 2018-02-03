<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.itwill.el.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.el.Member"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Member m1=new Member(1,"KIM",false,new Car("k3","KIA",2000));
	Member m2=new Member(2,"FIM",true,new Car("k4","KIA",3000));
	Member m3=new Member(3,"DIM",false,new Car("k5","KIA",4000));

	Member[] memberArray=new Member[3];
	memberArray[0]=m1;
	memberArray[1]=m2;
	memberArray[2]=m3;
	ArrayList<Member> memberList=new ArrayList<Member>();
	memberList.add(m1);
	memberList.add(m2);
	memberList.add(m3);
	
	HashMap<String,Member> memberMap=new HashMap<String,Member>();
	memberMap.put("m1", m1);
	memberMap.put("m2", m2);
	memberMap.put("m3", m3);
	
	request.setAttribute("memberArray", memberArray);
	request.setAttribute("memberList", memberList);
	request.setAttribute("memberMap", memberMap);
%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1> JSTL core forEach</h1><hr/>
<ul>
	<li>--------list-----</li>
	<c:forEach var="m" items="${memberList}" begin="0" step="1">
		<li>${m.no},${m.name},${m.married},${m.car.model},${m.car.company},${m.car.cc}</li>
	</c:forEach>
	<li>--------array-----</li>
	<c:forEach var="m" items="${memberArray}" begin="0" step="1">
		<li>${m.no},${m.name},${m.married},${m.car.model},${m.car.company},${m.car.cc}</li>
	</c:forEach>
	<li>--------map-----</li>
	<c:forEach var="entry" items="${memberMap}">
		<li>${entry.key},${entry.value}-->${entry.value.no},${entry.value.name}</li>
	</c:forEach>
	
</ul>
</body>
</html>











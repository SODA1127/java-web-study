<%@page import="com.itwill.el.Car"%>
<%@page import="com.itwill.el.Member"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
	Member m1 = new Member(1, "KIM", false, new Car("K3", "KIA", 2000));
	Member m2 = new Member(2, "QIM", true, new Car("K4", "KIA", 3000));
	Member m3= new Member(3, "DIM", false, new Car("K5", "KIA", 4000));
	HashMap<String, Member> mm = new HashMap<String, Member>();
	mm.put("m1", m1);
	mm.put("m2", m2);
	mm.put("m3", m3);
	
	request.setAttribute("memberMap", mm);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL map 출력</h1><hr/>
	<ul>
		<li>${memberMap}</li>
		<li>------ m1 ------</li>
		<li>${memberMap['m1']}</li>
		<li>${memberMap["m1"]}</li>
		<li>${memberMap["m1"].no}</li>
		<li>${memberMap['m1'].name}</li>
		<li>${memberMap.m1.married}</li>		
		<li>${memberMap.m1.car.model}</li>
		<li>${memberMap.m1.car.company}</li>
		<li>${memberMap.m1.car.cc}</li>
				
		<li>------ m2 ------</li>
		<li>${memberMap['m2']}</li>
		<li>------ m3 ------</li>
		<li>${memberMap['m3']}</li>
	</ul>
</body>
</html>
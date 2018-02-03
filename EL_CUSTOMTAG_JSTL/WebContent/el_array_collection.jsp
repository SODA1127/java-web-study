<%@page import="com.itwill.el.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.el.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member m1 = new Member(1, "KIM", false, new Car("K3", "KIA", 2000));
	Member m2 = new Member(2, "QIM", true, new Car("K4", "KIA", 3000));
	Member m3 = new Member(3, "DIM", false, new Car("K5", "KIA", 4000));

	Member[] memberArray = new Member[3];
	memberArray[0] = m1;
	memberArray[1] = m2;
	memberArray[2] = m3;

	ArrayList<Member> memberList = new ArrayList<Member>();
	memberList.add(m1);
	memberList.add(m2);
	memberList.add(m3);

	request.setAttribute("memberArray", memberArray);
	request.setAttribute("memberList", memberList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL array, Collection 출력</h1>
	<hr />
	<ul>
		<li>----- array -----</li>
		<li>${memberArray}</li>
		<li>${memberArray[0]}</li>
		<li>${memberArray[0].no}</li>
		<li>${memberArray[0].name}</li>
		<li>${memberArray[0].married}</li>
		<li>${memberArray[0].car.model}</li>

		<li>${memberArray[1]}</li>
		<li>${memberArray[1].no}</li>
		<li>${memberArray[1].name}</li>
		<li>${memberArray[1].married}</li>
		<li>${memberArray[1].car.model}</li>

		<li>----- array -----</li>
		<li>${memberList}</li>
		<li>${memberList[0].no}</li>
		<li>${memberList[0].name}</li>
		<li>${memberList[0].married}</li>
		<li>${memberList[0].car.model}</li>

		<li>${memberList["1"].no}</li>
		<li>${memberList["1"].name}</li>
		<li>${memberList["1"].married}</li>
		<li>${memberList["1"].car.model}</li>

		<%
			for (int i = 0; i < 3; i++) {
				pageContext.setAttribute("i", i);
		%>
		<li>${memberList[i].name}</li>
		<%
			}
		%>

	</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%
	boolean isNew = session.isNew();
	String sessionId = session.getId();
	long creationTime = session.getCreationTime();
	int maxInactiveInterval = session.getMaxInactiveInterval();
	long lastAccessedTime = session.getLastAccessedTime();
	
	/**** attribute set ****/
	session.setAttribute("attribute_name1", "속성객체1");
	session.setAttribute("attribute_name2", new Object());
	
	/**** attribute get ****/
	Object attribute1 = session.getAttribute("attribute_name1");
	Object attribute2 = session.getAttribute("attribute_name2");
	Object attribute3 = session.getAttribute("attribute_name3");
	
	/***************** 세션 객체에 같은 session[사용자] 요청시 카운트 증가 *****************/
	int count = 0;	
	Integer countInt = (Integer)session.getAttribute("count");
	if(countInt != null){		
		count = countInt.intValue();
	}
	count ++;
	session.setAttribute("count", count); //new Integer(count)
	
%>

<%
	System.out.println(
			request.getRemoteAddr() + "요청:-->[" + session.isNew() + "] 세션카운트 : " + count);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Session count[HttpSession]</h1>
	<ol>
		<li>세션카운트 : <%= count %></li>
		<li>세션생성 여부 : <%= isNew %></li>
		<li>세션아이디 : <%= sessionId %></li>
		<li>세션생성 시간 : <%= creationTime %></li>
		<li>세션 유효시간 : <%= maxInactiveInterval %></li>
		<li>세션 마지막 바인딩 : <%= lastAccessedTime %></li>
		<li>세션객체참조변수 : <%= session %></li>
		
		<li>세션객체 attribute1 : <%= attribute1 %></li>
		<li>세션객체 attribute2 : <%= attribute2 %></li>
		<li>세션객체 attribute3: <%= attribute3 %></li>
		
		
	</ol>
</body>
</html>
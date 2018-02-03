<?xml version="1.0" encoding="EUC-KR"?>
<%@page import="java.util.List"%>
<%@page import="com.itwill.user.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.user.UserService"%>
<%@page contentType="text/xml; charset=EUC-KR" %>
<%
System.out.println(request.getRemoteAddr()+" 님이 user_login_action.jsp 요청["+request.getMethod()+"]");

int status=0;
String msg="";
String sUserId=(String)session.getAttribute("sUserId");
if(sUserId==null){
	status=1;
	msg="로그인 하셔야합니다. 로그인화면 보여주셈!!!";
%>	
	<result>
		<status><%=status%></status>
		<msg><%=msg%></msg>
		<data> 
			<userList></userList>
		</data>
    </result>
<%	
 return;
}
String userId=request.getParameter("userId");
User user=null;
try{
	user= UserService.getInstance().findUser(userId);
	StringBuffer xmlData=new StringBuffer();
	msg="";
	status=0;
}catch(Exception e){
	status=1;
	msg=e.getMessage();
}
%>
<result>
		<status><%=status%></status>
		<msg><%=msg%></msg>
		<data> 
			<userList>
				<user id="<%=user.getUserId().trim()%>">
					<password><%=user.getPassword().trim()%></password>
					<name><%=user.getName().trim()%></name>
					<email><%=user.getEmail()%></email>
				</user>
			</userList>
		</data>
</result>

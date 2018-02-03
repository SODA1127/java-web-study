<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
session.invalidate();
status=0;
msg="로그아웃 메인화면으로이동";
%>
<result>
	<status><%=status %></status>
	<msg><%=msg%></msg>
	<data>
		<userList></userList>
	</data>
</result>
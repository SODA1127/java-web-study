<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%   
System.out.println(request.getRemoteAddr()+" ���� user_login_action.jsp ��û["+request.getMethod()+"]");

int status=0;
String msg="";
String sUserId=(String)session.getAttribute("sUserId");
if(sUserId==null){
	status=1;
	msg="�α��� �ϼž��մϴ�. �α���ȭ�� �����ּ�!!!";
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
msg="�α׾ƿ� ����ȭ�������̵�";
%>
<result>
	<status><%=status %></status>
	<msg><%=msg%></msg>
	<data>
		<userList></userList>
	</data>
</result>
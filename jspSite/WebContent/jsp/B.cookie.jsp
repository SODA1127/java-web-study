<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a:link {color:#FFFFFF}
a:visited {color:#FFFFFF}
a:hover {color:#00FF00}
a.m1 {font-size : 9pt; text-decoration : underline; COLOR: #0000FF}
a.m1:visited {font-size : 9pt; text-decoration : underline; COLOR: #0000FF}
a.m1:active {font-size : 9pt; text-decoration : underline; COLOR: #0000FF}
a.m1:hover {font-size : 9pt; text-decoration : underline; COLOR: #FF3300}
a.m2 {font-size : 10pt; text-decoration : none}
a.m2:visited {font-size : 10pt; text-decoration : none}
a.m2:active {font-size : 10pt; text-decoration : none}
a.m2:hover {font-size : 10pt; text-decoration : none}
.menu {color: #ffffff; font-size: 11pt; font-weight: bold; }
.t1 {font-size : 9pt; line-HEIGHT:140%;}
.t2 {font-size : 10pt;}
.TXTFLD {FONT-SIZE:9pt; COLOR:#000000; BORDER:1x SOLID #000000}
.TXTFLD1 {FONT-SIZE:9pt; COLOR:#0]00000; BORDER:0 SOLID #000000}
</style>
</head>

<body>
<br>
<table width="80%" border="0" cellspacing="0" cellpadding="2" align="center">
	
	<tr bgcolor=#a52a2a valign="middle">
		<td height="25" class="t1" align="center"><b><font size="3" color="#FFFFFF">�ޡޡ� HTTP�������ݰ� ��Ű �� ���� �ޡޡ�</font></b></td>   
	</tr>
    
	<tr>
		<td height="100" class="t1">
		<br>
		���� �ٰ��� �Ǵ� <font color="#FF0000">HTTP(HyperText Transfer Protocol)</font> ���������� ���������� �̹����� �������µ� �ſ�<br>   
		�̻����� ��������������, ������ �������α׷�(CGI, Servlet JSP, ASP, PHP)���� �����Ǵ� ��ȣ ��ȭ����<br> ������ ó���ϴµ��� ���� ���� ������ �ִ�.<br><br>   
		
		<font color="#0000FF">
		HTTP ���������� ���������� ��û�� ���� �� ���� ���ο� ��Ʈ��ũ ������ �̷������ ������<br>
		������� ��û�� ��Ʈ��ũ ������ ���ӵ��� �����Ƿ� Ŭ���̾�Ʈ�� ��û�� ���� ���� �Ҽ� ������,<br> Ŭ���̾�Ʈ�� ���������� ���� �� �� ����.</font><br><br>

		���°� ������ ���� �̿��� �������α׷�(��ǥ������ ���θ� ����)��  �����ϱ� ����� ���µ�,<br>   
		�̰��� ����ڰ� ���θ��� �湮�ؼ� ���ϴ� ��ǰ�� ������ ������ ������ ������ ��ǰ������<br>   
		�Ҿ������ ������ �߻��ϱ� �����̴�.<br><br>   
		
		<font color="#FF00FF">
		�̷��� ������ �ذ�(�������� ����)�ϱ� ���ؼ� ��Ű�� ������ �����ϰ� �Ǿ���.</font>   
		
		<br><br>
		</td>
	</tr>

	<tr>
		<td>
		<table width="100%" align="center" border="1" cellspacing="0" cellpadding="3"  bordercolordark="white" bordercolorlight="#000000">
			<tr bgcolor="#556b2f">
				<td align="center" height="25" class="t1"><b><font size="2" color="#FFFFFF">�� �� &nbsp;Ű ��</font></b>   
				</td>
			</tr>

			<tr bgcolor="#f0fff3">
				<td align="left" class="t1">
				<br>
				��Ű�� Ŭ���̾�Ʈ�� ���� ������ �����ϱ� ���� ������� �׽����������� ���ȵ� �����<br>   
				���������α׷����� �ʿ信 ����<br><br>   

				<font color="#0000CC">
				1) Ŭ���̾�Ʈ�� ������ �ؽ�Ʈ ���·� Ŭ���̾�Ʈ(��������)���� �����ϰ�<font color="#FF0000">(����޼����� ����� ����)</font>,<br><br>
				
				2) �� �������� ���۹��� �ؽ�Ʈ����(��Ű)�� �޸𸮿� �ε�(����)�ϰ� �ִٰ�, �ٽ� ��Ű�� ������ �ش�<br>&nbsp;&nbsp;&nbsp;����Ʈ�� �湮�� ��� ���������� �����ϵ��� �Ѵ�.<font color="#FF0000">(��û�޼����� ����� ����)</font><br><br>

				3) �������� ���� ���� ��Ű�� ���� �о� �鿩 ������ �۾��� ������ �� �ִ�.<br><br>
				</font>

				<font color="#FF00FF"><b>�� HTTP ���� �޼����� ��� ����</b></font><br>
				&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="#0000FF">Set-Cookie : name=value; expires=date; path=path; domain=domain; secure</font></b><br><br> 
				&nbsp;&nbsp;&nbsp;&nbsp;�� <b> <font color="#0000CC">name=valu</font>e</b> : ��Ű�� �̸��� ���� ����Ѵ�.([ ] ( ) = , " / ? @ : ; ���� Ư�����ڴ� ����� �� ����)<br>   
				&nbsp;&nbsp;&nbsp;&nbsp;�� <b> <font color="#0000CC"> expires=date</font></b> : ��Ű�� ��ȿ�Ⱓ�� ����Ѵ�. ����Ʈ�� ������ �������� ����Ǵ� ���ȿ��� ��ȿ.<br>   
				&nbsp;&nbsp;&nbsp;&nbsp;�� <b> <font color="#0000CC">path=path</font> </b> : ��Ű�� ����� �� �ִ� URL �н��� ����Ѵ�.<br>   
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ������� ����� ��Ű�� ������ URL�� �湮�� ��쿡�� ��Ű�� �����Ѵ�.<br>   
                &nbsp;&nbsp;&nbsp;&nbsp;�� <b><font color="#0000CC">domain=domain</font></b> : domain �Ӽ���   
                ����ϰ� �Ǹ� �ش� �������� ��������   
                �����ϴ� ��쿡�� ��Ű�� �����Ѵ�.<br>  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ����Ʈ�� ��Ű��   
                ������ ��ǻ�Ͱ� �ȴ�.<br>  
                &nbsp;&nbsp;&nbsp;&nbsp;�� <b><font color="#0000CC">secure</font></b> : secure��� ���������   
                ����ϸ� SSL(Secure Socket Layer: ���� ��ȣȭ   
                ��������)�� ����ϴ� �������� ��쿡�� ��Ű��   
                �����Ѵ�.<br>
                <br>

				<font color="#FF00FF"><b>�� HTTP ��û �޼����� ��� ����(�̸��� 
                ���� ��)</b></font><br>
				&nbsp;&nbsp;&nbsp;&nbsp;<font color="#0000FF"><b>Cookie : 
                name1=value1; name2=value2; name3=value3;<br>
                </b><br>
                <b>�� �̰� �Ƽ���??<br>
                </b></font>&nbsp;&nbsp;&nbsp;&nbsp; ��Ű��  
                Ŭ���̾�Ʈ���� ���Ϸ� ����Ǵ� ��쵵 �ְ�,  
                ������� ���� ��쵵 �ִ�.&nbsp;<br> 
                &nbsp;&nbsp;&nbsp;&nbsp; ���������α׷����� ��Ű��  
                ������ ���� expires �Ӽ��� �������� �ʴ�  
                ��쿡�� ��������<br> 
                &nbsp;&nbsp;&nbsp;&nbsp; ����Ǵ� ��쿡��  
                ��ȿ������, ���� expire�� �ʴ����� �����ϰ�  
                �Ǹ� ���Ϸ� ����ȴ�.<br> 
                &nbsp;&nbsp;&nbsp;&nbsp; ( �ִ� 300��, �ִ� 4KB)<br> 
                <b><br>
                </b>&nbsp;&nbsp;&nbsp;&nbsp; ����Ǵ� ��ġ��  
                �ͽ��÷η��� ��� Cookies ���丮�� ����ǰ�,<br> 
                &nbsp;&nbsp;&nbsp;&nbsp; �׽��������� ��� cookie.txt  
                ���Ͽ� ����ȴ�.<br> 
                <br>
                <b><font color="#CC3300" size="3"><br>
                </font></b>
                <p align="left"><b><font color="#CC3300" size="3">��������</font></b><b><font color="#CC3300" size="3"> 
                �������� ��Ű ���� ����<br>
                <br>
                </font></b><font color="#CC3300">1. Cookie Ŭ������ 
                �̿��Ͽ� ��Ű��ü�� �����.</font><br>
                &nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">Cookie(String  
                name, String value)</font></b>; �̸��� ���� �̿��Ͽ�  
                ��Ű ����<br> 
                <br>
                <font color="#CC3300">2. ������ ��Ű ��ü�� �Ӽ��� 
                �ο��� �� �ִ�.</font><br>
                &nbsp;&nbsp;&nbsp; �� <font color="#0000CC"><b>setPath(String  
                url)</b></font>; ��Ű�� ����� �н��� �����ϴ�  
                �޼ҵ��, �н��� �����Ǹ� �ش�Ǵ�<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �н���  
                �湮�ϴ� ��쿡�� ���������� ��������  
                ��Ű�� �����Ѵ�.<br> 
                &nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">setDomain(String  
                pattern)</font></b>; ��Ű�� ���� ��������  
                �����ϴ� �޼ҵ�� �ش�Ǵ� �����ο�<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ���� ��ǻ�͸�  
                �湮�� �� ���������� �������� ��Ű��  
                �����Ѵ�.&nbsp;<font size="3"><br>
                </font>&nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">setValue(String  
                newValue)</font></b>; ���ο� ��Ű�� ���� ������  
                ��� ����ϴ� �޼ҵ��̴�.<font size="3"><br> 
                </font>&nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">setMaxAge(int  
                expires)</font></b>; ��Ű�� ��ȿ�� �Ⱓ�� �����Ѵ�.<font size="3"><br> 
                </font>&nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">setSecure(boolean  
                flag)</font></b>; ������ �����ϴ� �޼ҵ�� flag��  
                true�̸� ���ȼ��� �ִ� ����(SSL)<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �� ��쿡��  
                ��Ű�� �����Ѵ�.<br> 
                <font size="3"><br>
                </font><font color="#CC3300">3. ��Ű�� �����Ѵ�.</font><font size="3"><br>
                </font>&nbsp;&nbsp;&nbsp; �� <font color="#0000CC"><b>res.addCookie(cookie)</b></font>;  
                HttpServletResponse ��ü�� �̿��Ͽ� ����������  
                ��Ű�� �о�<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �ִ´�.<br> 
                <br>
                <br>
                <b><font color="#CC3300" size="3">��������</font></b><b><font color="#CC3300" size="3"> 
                �������� ��Ű ���� ��� ����</font></b><br>
                <br>
                <font color="#CC3300">4. ������� ��û���� ��� 
                ��Ű�� ���´�.</font><br>
                &nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">Cookie[] cookies  
                = req.getCookies()</font></b>; HttpServletRequest ��ü��  
                �̿��Ͽ�<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��� ��Ű��  
                ��´�.<br>
                <br>
                <font color="#CC3300">5. ��Ű�� �̸��� �̿��Ͽ� 
                ���ϴ� ��Ű�� ã�´�.</font><br>
                &nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">String name =  
                cookies[i].getName()</font></b>;<br>
                &nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">if(name.equals(&quot;id&quot;)){.........};<br> 
                <br>
                </font></b><font color="#CC3300">6. ��Ű�� ���� 
                �����Ѵ�.</font><br>
                &nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">String value =  
                cookies[i].getValue()</font></b>;<br>
                <b><br>
                <br>
                </b><b><font color="#CC3300" size="3">��������</font></b><b><font color="#CC3300" size="3"> 
                �������� ��Ű ���� ���</font></b><br>
                <br>
                <font color="#CC3300">7. </font><font color="#CC3300">�����ϰ��� 
                �ϴ� ��Ű�͵����� �̸��� ��Ű�� �����ϰ� 
                cookie.setMaxAge(0)�� ȣ�����ָ� �ȴ�.</font><br>
                &nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">Cookie id = new  
                Cookie(&quot;id&quot;, &quot;&quot;);<br>
                </font></b>&nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">id.setMaxAge(0);<br> 
                </font></b>&nbsp;&nbsp;&nbsp; �� <b><font color="#0000CC">res.addCookie(id);<br> 
                <br>
                </font></b></p>
				</td>
			</tr>

			<tr>
				<td align="center" height="40">
                <a href="B.cookie_create_form.jsp" class="m1">[ ��Ű������ ]</a>
                
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<br>
<br>



</body>
</html>
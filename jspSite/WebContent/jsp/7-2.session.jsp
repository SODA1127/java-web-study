<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>

<head>
<meta charset="utf-8">
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
		<td height="25" class="t1" align="center" bgcolor="#A52E78"><b><font size="3" color="#FFFFFF">�ޡޡ�   
          ��&nbsp;&nbsp; �� �ޡޡ�</font></b></td>      
	</tr>
    
	<tr>
		<td height="100" class="t1">
		<br>
        <br>
        �����̶� ���� �ð� ����(����Ʈ 30��) ����   
        �����(��Ȯ�� ���ϸ� ���� ������)�� ����   
        ������<br>
        �Ϸ��� �䱸�� �ϳ��� ���·� ���� �� ���¸�   
        �����ϰ� ������Ű�� ����̴�.<br>  
        <br>
        ���� �� ���θ����� ��ٱ��ϸ� ������ �� �ſ�   
        �����ϰ� ���� �� �ִ�. �� ���θ����� ����ڰ�<br>  
        ��ǰ�� �ֹ��� ������ �� ����ڿ� ���� ��ǰ��   
        �������� ������ �θ� ���߿� �� ���� ������ ��ǰ�� <br>  
        ���ǿ� ����� �������� ������ �� �ִ� ���Դϴ�.<br>  
        <br>
        <font color="#0000FF">�������� ������ HttpSession   
        �������̽��� ǥ���ȴ�. ������ HttpSession   
        �������̽��� ���ø������ϴ�<br>  
        Ŭ������ ���� �����̳�(����)������ ����� ����,   
        �������� ���� ��ü�� ����� �� ��쿡��<br>  
        </font><font color="#FF0000"><b>HttpServletRequest�� getSession(true);   
        �޼ҵ忡 ���� �� �ִ�.</b></font><font color="#0000FF">   
        ����� ���� ��ü�� ������ ID��<br>  
        (</font><font color="#FF0000">���Ǿ��̵�</font><font color="#0000FF">)��   
        �ο������Ƿν� ������ Ŭ���̾�Ʈ�� �����Ѵ�.<br>  
        </font><br>
		</td>
	</tr>

	<tr>
		<td>
		<table width="100%" align="center" border="1" cellspacing="0" cellpadding="3"  bordercolordark="white" bordercolorlight="#000000">
			<tr bgcolor="#556b2f">
				<td align="center" height="25" class="t1"><b><font size="2" color="#FFFFFF">��   
                  ���� Ʈ��ŷ ���(���� ���̵� ���� ���) ��</font></b>     
				</td>
			</tr>

			<tr bgcolor="#f0fff3">
				<td align="left" class="t1">
				<br>

				<font color="#FF00FF"><b>�� ��Ű�� �̿��� ����</b></font><br> 
                ���� ����鼭 ���� ���� ����ϴ� �������   
                ������ �����Ǹ� ������ �Ǵ� ������   
                ���̵���<br>
                <font color="#0000CC">JSESSIONID</font>��� ��Ű   
                �̸����� ���� �����Ͽ� Ŭ���̾�Ʈ�� �����ϴ�   
                ����̴�.<br>
                <br>
                �������� ����Ʈ�� ���Ǵ��� ��Ű�� ����ϱ�   
                ������ ���� ������ �� �ִ�.<br>  
                <br>
                <br>

				<font color="#FF00FF"><b>�� URL rewriting�� �̿��� ����</b></font><br>
                ��Ű�� �̿��ϴ� ���Ǿ��̵� �����ϴ� �����   
                �����ϳ�, ����ڰ� ���������� ���� ����   
                ��Ű��<br>
                ������� �ʴ� ��쿡�� ����� �� ���� �ȴ�.<br>  
                <br>
                �̷��� ������ �����Ͽ� ���°��� URL rewriting   
                ����ε� URL�� ������Ʈ�� �κп� ���Ǿ��̵�<br>  
                �߰��Ͽ� Ŭ���̾�Ʈ�� �����ϴ� ����̴�.<br>  
                <br>
                [��] http://ip:8080/servlet/ServletName<b><font color="#0000FF">;JSESSIONID=To1018mc4894848848484AT<br>  
                <br>
                </font></b>&nbsp;&nbsp;&nbsp;&nbsp;�� URL Rewriting��   
                ����Ϸ��� HttpServletResponse�� encodeURL()�޼ҵ带   
                ����ؼ� ���ڵ�<br>  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �ؾ� �Ѵ�.<br>  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#0000FF"><b>��   
                String newURL = res.encodeURL(url);<br>   
                </b></font><br>
                <br>

				<font color="#FF00FF"><b>�� URL rewriting�� �̿��� ����</b></font><br>
                HTML�� FORM �±��� HIDDEN Ÿ������ ���Ǿ��̵�   
                Ŭ���̾�Ʈ�� �����ϴ� ����̴�.<br>  
                <br>
                [��] <font color="#0000FF"><b>&lt;INPUT TYPE=&quot;HIDDEN&quot;   
                NAME=&quot;name&quot; VALUE=&quot;value&quot;&gt;<br>
                </b></font><br>&nbsp;&nbsp;&nbsp;&nbsp; <b><font color="#0000CC"> 
                <br>
                </font></b>
				</td>
			</tr>
			
		</table>
		</td>
	</tr>

	<tr>
	  <td>
	  <br>
	  <br>
		<table width="100%" align="center" border="1" cellspacing="0" cellpadding="3"  bordercolordark="white" bordercolorlight="#000000">
			<tr bgcolor="#556b2f">
				<td align="center" height="25" class="t1"><b><font size="2" color="#FFFFFF">��   
                  ������ ���� ��� ��</font></b>     
				</td>
			</tr>

			<tr bgcolor="#f0fff3">
				<td align="left" class="t1">
				<br>

                <b>

				<font color="#FF00FF">�� HttpServletRequest ��ü�� 
                getSession(true)</font></b><b><font color="#FF00FF">�޼ҵ带 
                �̿��Ͽ� ������ ��´�.</font></b><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �� ���������� getSession()  
                �޼ҵ带 ���ϱ� ���� HttpServletResponse ��  
                �޼ҵ带 ����<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ȣ���ؼ���  
                �ȵȴ�.<br>
                <br>
                [��] <font color="#0000FF"><b>HttpSession session =  
                req.getSession(true);<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PrintWriter out = res.getWriter();</b></font><br>&nbsp;&nbsp;&nbsp;&nbsp; <b><font color="#0000CC"> 
                <br>
                </font></b>
				</td>
			</tr>
		</table>
		</td>
	</tr>

	<tr>
	  <td>
	  <br>
	  <br>
		<table width="100%" align="center" border="1" cellspacing="0" cellpadding="3"  bordercolordark="white" bordercolorlight="#000000">
			<tr bgcolor="#556b2f">
				<td align="center" height="25" class="t1"><b><font size="2" color="#FFFFFF">��   
                  ���ǿ� �����͸� �����ϰ� ������ �ֿ� 
                  �޼ҵ� ��</font></b>    
				</td>
			</tr>

			<tr bgcolor="#f0fff3">
				<td align="left" class="t1">
				<br>

                <b>

				<font color="#FF00FF">�� vod setAttribute(String name, Object 
                value);</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ���ǰ�ü�� name�̶�� 
                �̸����� value���� �����Ѵ�.<br>
                <br>

                <b>

				<font color="#FF00FF">�� Object getAttribute(String name);</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �־��� name���� ����� 
                ���� Object Ÿ������ �����Ѵ�.<br>
                <br>

				<font color="#FF00FF">

                <b>

                �� Enumeration getAttributeNames();<br>
                </b></font>&nbsp;&nbsp;&nbsp; ���ǰ�ü�� ����� ��� 
                ���� �̸��� Enumeration Ÿ������ �����Ѵ�.<br>
                <br>

				<font color="#FF00FF"><b>�� String getId();<br>
                </b></font>&nbsp;&nbsp;&nbsp; ������ ������ ������ 
                ���Ǿ��̵� ������ �ش�.<br>
                <br>

				<font color="#FF00FF">

                <b>

                �� long getCreationTime();<br>
                </b></font>&nbsp;&nbsp;&nbsp; 1970�� 1�� 1�� 0�� 0�� 0�ʸ� 
                �������� ������ ������ �ð��� ������ �ش�(����: 
                ms).&nbsp;<br>
                <br>

				<font color="#FF00FF">

                <b>

                �� long getLastAccessedTime();<br>
                </b></font>&nbsp;&nbsp;&nbsp; Ŭ���̾�Ʈ�� �� ���ǿ� 
                ����� �䱸�� �� ���� �ֱ��� �ð��� ������ 
                �ش�.<br>
                <br>

				<font color="#FF00FF"><b>�� int getMaxInactiveInterval();<br>
                </b></font>&nbsp;&nbsp;&nbsp; ������ Ŭ���̾�Ʈ�� 
                ��û�� ���� ��� ������ �����ϴ� �ð��� 
                ������ �ش�.(����Ʈ 30��)<br>
                <br>
                <font color="#FF00FF"><b>�� boolean isNew();<br>
                </b></font>&nbsp;&nbsp;&nbsp; ������ �����Ǳ� 
                �Ͽ����� Ŭ���̾�Ʈ�� ���� ���� ������ 
                �������� �ʾ��� ��� true�� �����Ѵ�.<br>
                <br>
                <font color="#FF00FF"><b>�� void removeAttribute(String name);<br>
                </b></font>&nbsp;&nbsp;&nbsp; �־��� �̸��� ��(��ü)�� 
                ���ǿ��� ������ ��� ����Ѵ�.<br>
                <br>
                <font color="#FF00FF"><b>�� void invalidate();<br>
                </b></font>&nbsp;&nbsp;&nbsp; ���� �����Ǿ� �ִ� 
                ������ ������ ��� ����մϴ�.<br>
                &nbsp;&nbsp;&nbsp; <b><font color="#0000CC"> 
                <br>
                </font></b>
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
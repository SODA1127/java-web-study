<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>

<head>

<style type="text/css">
a:link {
	color: #FFFFFF
}

a:visited {
	color: #FFFFFF
}

a:hover {
	color: #00FF00
}

a.m1 {
	font-size: 9pt;
	text-decoration: underline;
	COLOR: #0000FF
}

a.m1:visited {
	font-size: 9pt;
	text-decoration: underline;
	COLOR: #0000FF
}

a.m1:active {
	font-size: 9pt;
	text-decoration: underline;
	COLOR: #0000FF
}

a.m1:hover {
	font-size: 9pt;
	text-decoration: underline;
	COLOR: #FF3300
}

a.m2 {
	font-size: 10pt;
	text-decoration: none
}

a.m2:visited {
	font-size: 10pt;
	text-decoration: none
}

a.m2:active {
	font-size: 10pt;
	text-decoration: none
}

a.m2:hover {
	font-size: 10pt;
	text-decoration: none
}

.menu {
	color: #ffffff;
	font-size: 11pt;
	font-weight: bold;
}

.t1 {
	font-size: 9pt;
	line-HEIGHT: 140%;
}

.t2 {
	font-size: 10pt;
}

.TXTFLD {
	FONT-SIZE: 9pt;
	COLOR: #000000;
	BORDER: 1x SOLID #000000
}

.TXTFLD1 {
	FONT-SIZE: 9pt;
	COLOR: #000000;
	BORDER: 0 SOLID #000000
}
</style>
</head>

<body>
	<br>
	<table width="80%" border="0" cellspacing="0" cellpadding="2"
		align="center">

		<tr bgcolor=#a52a2a valign="middle">
			<td height="25" class="t1" align="center"><b><font size="3"
					color="#FFFFFF">�ޡޡ� ��Ƽ��Ʈ�� ���� ���ε� �ޡޡ�</font></b></td>
		</tr>

		<tr>
			<td height="100" class="t1"><br> HTTP������ POST ������� ������ ���ε�
				�� �� �ִ� ����� �����ϴµ� ������ ���� �����Ͽ��� �Ѵ�.<br>
			<br> <font color="#0000ff"> �� &lt;FORM&gt; �±׿��� method��
					POST������� �����Ѵ�.<br>
				<br> �� action="upload.jsp" : ���� ���ε带 ���� JSP�� �����Ѵ�.<br>
				<br> �� enctype="multipart/form-data" : ���ε��� ������ ������ �����ϴ� ������
					�ݵ�� �����Ѵ�.<br>
				<br> �� &lt;input type="file" name="upfile"&gt; : ������ ���ε��ϱ� ����
					input type�� ������<br> &nbsp;&nbsp;&nbsp;&nbsp;"file"�� ������ �־��
					�Ѵ�. �̴� �������� ������ ������ �� �ִ� ��ư�� �ڵ����� ���������ν�,<br>
					&nbsp;&nbsp;&nbsp;&nbsp;����ڰ� �������� �ϴ� ������ ������ �� �ֵ��� �ϴ� ���̴�.
			</font></td>
		</tr>
	</table>

	<br>
	<br>
	<form method="POST" action="A.upload_view.jsp"
		enctype="multipart/form-data">

		<table border=0 cellpadding=0 cellspacing=0 width=500 align=center>
			<td valign=top bgcolor=#000000 align=center>
				<table border=0 cellpadding=1 cellspacing=1 width=500>
					<tr bgcolor="#556b2f" class="menu">
						<td align=center colspan=2>��Ƽ��Ʈ / ���� ���ε�(���ε�� ������ ����)</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td width=100 align=center class="t1">�ø���</td>
						<td width=400 align=left>&nbsp;<input type=text name=name
							size=10 maxlength=10 class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center class="t1">���ϼ���</td>
						<td align=left>&nbsp;<input type=file name=fileone size=40
							class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center colspan=2><input type=submit value=�ö󰡰Ŷ�...
							style="background-color: #bbdb76; border: 1 solid #556b2f; color: #4B0082;"></td>
					</tr>
				</table>
			</td>
		</table>
	</form>
	


	<br>
	<br>
	<br>
	<br>


	<form method="POST" action="A.upload.jsp"
		enctype="multipart/form-data">

		<table border=0 cellpadding=0 cellspacing=0 width=500 align=center>
			<td valign=top bgcolor=#000000 align=center>

				<table border=0 cellpadding=1 cellspacing=1 width=500>

					<tr bgcolor="#556b2f">
						<td align=center colspan=2 class="menu">��Ƽ��Ʈ / ���� ���ε�(�ø���)</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td width=100 align=center class="t1">�ø���</td>
						<td width=400 align=left>&nbsp;<input type=text name=name
							size=10 maxlength=10 class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center class="t1">���ϼ���1</td>
						<td align=left>&nbsp;<input type=file name=fileone size=40
							class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center class="t1">���ϼ���2</td>
						<td align=left>&nbsp;<input type=file name=filetwo size=40
							class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center colspan=2><input type=submit value=�ö󰡰Ŷ�...
							style="background-color: #bbdb76; border: 1 solid #556b2f; color: #4B0082;"></td>
					</tr>

				</table>

			</td>
		</table>

	</form>

	

</body>
</html>
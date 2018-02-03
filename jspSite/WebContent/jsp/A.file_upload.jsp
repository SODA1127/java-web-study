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
					color="#FFFFFF">◇◇◇ 멀티파트와 파일 업로드 ◇◇◇</font></b></td>
		</tr>

		<tr>
			<td height="100" class="t1"><br> HTTP에서는 POST 방식으로 파일을 업로드
				할 수 있는 방법을 제공하는데 다음과 같이 설정하여야 한다.<br>
			<br> <font color="#0000ff"> ▶ &lt;FORM&gt; 태그에서 method를
					POST방식으로 설정한다.<br>
				<br> ▶ action="upload.jsp" : 파일 업로드를 위한 JSP를 지정한다.<br>
				<br> ▶ enctype="multipart/form-data" : 업로드할 파일의 형식을 지정하는 것으로
					반드시 설정한다.<br>
				<br> ▶ &lt;input type="file" name="upfile"&gt; : 파일을 업로드하기 위해
					input type의 형식을<br> &nbsp;&nbsp;&nbsp;&nbsp;"file"로 지정해 주어야
					한다. 이는 브라우저가 파일을 선택할 수 있는 버튼을 자동으로 제공함으로써,<br>
					&nbsp;&nbsp;&nbsp;&nbsp;사용자가 보내고자 하는 파일을 선택할 수 있도록 하는 것이다.
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
						<td align=center colspan=2>멀티파트 / 파일 업로드(업로드된 데이터 보기)</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td width=100 align=center class="t1">올린이</td>
						<td width=400 align=left>&nbsp;<input type=text name=name
							size=10 maxlength=10 class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center class="t1">파일선택</td>
						<td align=left>&nbsp;<input type=file name=fileone size=40
							class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center colspan=2><input type=submit value=올라가거라...
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
						<td align=center colspan=2 class="menu">멀티파트 / 파일 업로드(올리기)</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td width=100 align=center class="t1">올린이</td>
						<td width=400 align=left>&nbsp;<input type=text name=name
							size=10 maxlength=10 class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center class="t1">파일선택1</td>
						<td align=left>&nbsp;<input type=file name=fileone size=40
							class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center class="t1">파일선택2</td>
						<td align=left>&nbsp;<input type=file name=filetwo size=40
							class="TXTFLD">
						</td>
					</tr>

					<tr bgcolor=#f4f4f4>
						<td align=center colspan=2><input type=submit value=올라가거라...
							style="background-color: #bbdb76; border: 1 solid #556b2f; color: #4B0082;"></td>
					</tr>

				</table>

			</td>
		</table>

	</form>

	

</body>
</html>
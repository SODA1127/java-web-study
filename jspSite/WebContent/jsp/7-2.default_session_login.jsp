<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head><title>ȸ�� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/com.css">
<SCRIPT LANGUAGE="JavaScript" SRC="js/common.js">
</SCRIPT>
<SCRIPT language="JavaScript">
function loading(form)
{
	form.id.focus();
}
function form_submit(form, action)
{
	if(is_null_field(form)) 
		return;
	 form.action = action;
	 form.method = 'POST';
	 return(form.submit());
}


function is_null_field(form)
{
	
	if(is_null(form.id.value) || is_space(form.id.value))
	{
		alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
		form.id.focus();
		return true;
	}
	if(is_null(form.pass.value) || is_space(form.pass.value))
	{
		alert("��й�ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.pass.focus();
		return true;
	}
}

</SCRIPT>
</head>

<body onLoad="JavaScript:loading(document.login)">
<h3 align="center">�ߡߡ� ȸ�� �α��� �ߡߡ�</h3>

<form  name="login" action="JavaScript:form_submit(document.login, '7-2.default_session_login_action.jsp');">
<table bgcolor="black" cellspacing="1" cellpadding="5" align="center">
<tr>
<th bgcolor="44ff44"><font size="2">���̵�</font></th><td bgcolor="white" width="170" align="center"><input type="text" size="20" name="id"></td>
</tr>
<tr>
<th bgcolor="44ff44"><font size="2">��й�ȣ</font></th><td bgcolor="white" width="170" align="center"><input type="password" size="20" name="pass"></td>
</tr>
<tr>
<th colspan="2" bgcolor="ff8888"><input type="checkbox" name="savecookie" value="checked"><font size="2">ID����</font> &nbsp;<input type="submit" value="�α���" class="TXTFLD"></th>
</tr>
</table>
</form>


</body>
</html>

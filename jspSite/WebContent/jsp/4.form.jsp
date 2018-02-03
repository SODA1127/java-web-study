<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" type="text/css" href="../css/co.css">
<link rel="stylesheet" type="text/css" href="../css/member.css">

<script type="text/javascript" src="../js/member.js"></script>
<!--
js파일 include 하는 script element는 태그안에내용을 가질수없다.
-->
<script type="text/javascript" src="../js/co.js"></script>
<script type="text/javascript">
/****************** co.js ******************


function is_null(v){
	if(v==null|| v==''){
		return true;
	}
	return false;
}
function isSame(v1,v2){
	if(v1==null || v2==null || v1.length==0 || v2.length==0){
		return false;
	}
	if(v1!=v2){
		return false;
	}
	return true;
}
*/

/********************* member.js *********************
	function loadingFocus(){
		document.join.id.focus();
	}
	
	function join_form_submit() {
		if(is_null(document.join.id.value)){
			document.join.id.focus();
			alert("아이디를 입력하세요!!!");
			return;
		}
		if(is_null(document.join.pass.value)){
			document.join.pass.focus();
			alert("패쓰워드를 입력하세요!!!");
			return;
		}
		if(is_null(document.join.repass.value)){
			document.join.repass.focus();
			alert("패쓰워드확인을 입력하세요!!!");
			return;
		}
		
		if(!isSame(document.join.pass.value,document.join.repass.value)){
			alert("패쓰워드와 패쓰워드확인은 일치하여야합니다.");
			document.join.pass.select();
			return;
		}
		if(!confirm("진짜로 가입할래요?")){
			return;
		}
		
		document.join.action = '4.join_action.jsp';
		document.join.method = 'POST';
		document.join.submit();
	}
*/
</script>
</head>
<body onload="loadingFocus();">
	<h3 align="center">◆◆◆ 회원가입 ◆◆◆</h3>
	<form name="join" method="post">

		<table id="jointbl" bgcolor="black" cellspacing="1" cellpadding="5"
			align="center">
			<tr id="first-tr">
				<th bgcolor="44ff44"><font size="2">아이디</font></th>
				<td bgcolor="white" width="300"><input type="text" size="10"
					name="id" class="TXTFLD"><span id="idL"></span></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">비밀번호</font></th>
				<td bgcolor="white" width="300"><input type="password"
					size="10" name="pass" class="TXTFLD1"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">비밀번호확인</font></th>
				<td bgcolor="white" width="300"><input type="password"
					size="10" name="repass" class="TXTFLD"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">이름</font></th>
				<td bgcolor="white" width="300"><input type="text" size="10"
					name="name" class="TXTFLD"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">주소</font></th>
				<td bgcolor="white" width="300"><input type="text" size="30"
					name="addr" class="TXTFLD"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">성별</font></th>
				<td bgcolor="white" width="300"><input type="radio"
					name="gender" value="남자"><font size="2">남자</font> <input
					type="radio" name="gender" value="여자" checked="checked"><font
					size="2">여자</font></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">직업</font></th>
				<td bgcolor="white" width="300"><select name="job" size="1">
						<option value="직업을선택하세요">직업을선택하세요</option>
						<option value="학생">학생</option>
						<option value="주부">주부</option>
						<option value="회사원">회사원</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">취미</font></th>
				<td bgcolor="white" width="300"><input type="checkbox"
					name="hobby" value="컴퓨터" checked><font size="2">컴퓨터</font>
					<input type="checkbox" name="hobby" value="낮잠"><font
					size="2">낮잠</font> <input type="checkbox" name="hobby" value="연애"><font
					size="2">연애</font> <input type="checkbox" name="hobby" value="운동"><font
					size="2">운동</font> <input type="checkbox" name="hobby" value="기타"><font
					size="2">기타</font></td>
			</tr>
			<tr bgcolor="ff8888">
				<td align="center" colspan="2"><input type="button" value="가입"
					onclick="join_form_submit();"> <a
					href="javascript:join_form_submit();"> 가입요청 </a> <a
					href="javascript:join_form_submit();"> <img src="../okbtn.gif" />
				</a> <input type="reset" value="취소"></td>
			</tr>


		</table>
	</form>
	<div id="footer">
		<%@include file="5-6.directive_included_file.jspf" %>
	</div>

</body>
</html>

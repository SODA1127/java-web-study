<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입폼</h1>
	<form action="address_insert_action.jsp" method="post">
		번호:<input type="text" name="no"><br/>
		아이디:<input type="text" name="id"><br/>
		이름:<input type="text" name="name"><br/>
		전화번호:<input type="text" name="phone"><br/>
		주소:<input type="text" name="address"><br/>
		<input type="submit" value="가입">
		<input type="reset" value="취소">
	</form>
	<div>
		<a href='address_list.jsp'>주소록리스트</a>
	</div>
	
</body>
</html>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Integer boardno=null;
	int pageno=1;
	try{
		boardno=Integer.parseInt(request.getParameter("boardno"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		
	}
	if(boardno==null){
		//목록으로이동
		response.sendRedirect("board_list.jsp?pageno="+pageno);
		return;
	}
	Board board=BoardService.getInstance().findBoard(boardno);
	if(board==null){
		response.sendRedirect("board_list.jsp?pageno="+pageno);
		return;
	}
	//읽은회수증가
	BoardService.getInstance().updateHitCount(boardno);
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script language="JavaScript">
	function boardCreate() {
		f.action = "board_write.jsp";
		f.submit();
	}
	function boardReplyCreate() {
		document.f.action = "board_reply_write.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	function boardUpdate() {
		f.action = "board_modify.jsp";
		f.submit();
	}
	function boardRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			f.action = "board_remove_action.jsp";
			f.submit();
		}
	}
	function boardList() {
		f.action = "board_list.jsp?pageno="+<%=pageno%>;
		f.submit();
	}
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b> 게시물
											내용보기 </b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->
							<!-- 
							<form name="f" method="post">
					<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>">
					<input type="hidden" name="pageno" value="<%=pageno%>">
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getWriter()%></td>
						</tr>

						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getTitle()%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getContent()%></td>
						</tr>
						
					</table>
					
				</form>
							 -->
							<form name="f" method="post">
								<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getWriter()%></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getTitle()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" height="180px"
											style="padding-left: 10px" align="left"><%=board.getContent().replace("\n","<br/>")%><br />

										</td>
									</tr>

								</table>

							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<input type="button" value="글쓰기" onClick="boardCreate()"> &nbsp;
										<input type="button" value="답글쓰기" onClick="boardReplyCreate()"> &nbsp;
										<input type="button" value="수정" onClick="boardUpdate()"> &nbsp;
										<input type="button" value="삭제" onClick="boardRemove()"> &nbsp;
										<input type="button" value="리스트" onClick="boardList()">
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
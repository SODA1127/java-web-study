<%@page import="com.itwill.board.BoardComment"%>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Integer boardno = null;
	int pageno = 1;
	try {
		boardno = Integer.parseInt(request.getParameter("boardno"));
		pageno = Integer.parseInt(request.getParameter("pageno"));
	} catch (Exception e) {

	}
	if (boardno == null) {
		//목록으로이동
		response.sendRedirect("board_list.jsp?pageno=" + pageno);
		return;
	}
	Board board = BoardService.getInstance().findBoard(boardno);
	if (board == null) {
		response.sendRedirect("board_list.jsp?pageno=" + pageno);
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
		f.action = "board_reply_write.jsp";
		f.submit();
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
		f.action = "board_list.jsp?pageno=" +<%=pageno%>;
		f.submit();
	}
	/*
	function writeComment(commenteditform){
		alert('commenteditform:'+commenteditform);
		var commentform=document.getElementById(commenteditform);
		commentform.submit();
	}
	*/
	function updateComment(f){
		alert('commenteditform:'+f);
		var commenteditform=document.getElementById(f);
		commenteditform.submit();
	}
	
	function writeComment(){
		var commentform=document.getElementById('commentform');
		
		commentform.submit();
	}
	function toggleCommentStatus(boardNo, edit) {
		document.getElementById("commentview" + boardNo).style.display = 
		edit ? 'none' : 'block';
		document.getElementById("commentedit" + boardNo).style.display = 
		edit ? 'block' : 'none';
	}
	
	function deleteComment(commentNo, boardNo, pageNo) {
		var result = confirm(commentNo + "번 댓글을 삭제합니다.");
		if (result) {
			location.href='board_comment_delete_action.jsp?' +
				'commentno=' + commentNo + 
				'&boardno=' + boardNo + '&pageno=' + pageNo;
		}
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form id="xxx">
		<input type="hidden" name="a">
		<input type="hidden" name="b">
	</form>
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
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<input type="hidden" name="boardno"
									value="<%=board.getBoardNo()%>"> <input type="hidden"
									name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590px"
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
											style="padding-left: 10px" align="left"><%=board.getContent().replace("\n", "<br/>")%><br />

										</td>
									</tr>
								</table>
							</form> <%
 	if (board.getComments().size() == 0) {
 %>
							<div id="nodata" style="text-align: center">
								<b>작성된 댓글이 없습니다.</b>
							</div> <%
 	} else {
 %>
							<table style="padding-left: 10px; width: 550px" background="gray"
								border="0" cellpadding="0" cellspacing="1">
								<%
									for (BoardComment bcomment : board.getComments()) {
								%>
								<tr>
									<td bgcolor="ffffff">
										<div
											style="border: 1px solid gray; background-color: lightgray; padding: 0px; margin: 0px"
											id="commentview<%=bcomment.getCommentNo()%>">
											<table>
												<tr>
													<td style="border: 1px solid; width: 80px"><%=bcomment.getWriter()%><br />
														<%=bcomment.getRegDate()%></td>
													<td style="width: 400px"><%=bcomment.getContent().replace("\r\n", "<br />")%>
													</td>
													<td style="width: 40px"><input type="button"
														value="편집" onclick="toggleCommentStatus(<%= bcomment.getCommentNo() %>, true);"/><br /> 
														<input type="button" value="삭제" onclick="deleteComment(<%=bcomment.getCommentNo()%>,<%= board.getBoardNo()%>,<%= pageno %>)" /></td>
												</tr>
											</table>
										</div>

										<div id='commentedit<%=bcomment.getCommentNo()%>'
											style="border: 1px solid gray; background-color: #dfdfdf; padding: 0px; margin: 0px;display:none">
											<table>
												<tr>
												<td style="border: 1px solid; width: 80px"><%=bcomment.getWriter()%><br />
														<%=bcomment.getRegDate()%></td>
												<td style="width:400px;padding:0px;margin:0px">												
												<form id="commenteditform<%=bcomment.getCommentNo()%>"
													action="board_comment_update_action.jsp" method="post" style="width: 400px;padding:0px;margin:0px">
													<input type="hidden" name="boardno"
														value="<%=board.getBoardNo()%>" /> <input type="hidden"
														name="pageno" value="<%=pageno%>" /> <input
														type="hidden" name="commentno"
														value="<%=bcomment.getCommentNo()%>" />
													<textarea name="content"  rows="2" style="width: 400px;padding:0px;margin:0px"><%=bcomment.getContent()%></textarea>
												</form>
												</td>
												<td style="width: 40px"><input type="button"
														value="수정" 
														onclick="updateComment('commenteditform<%= bcomment.getCommentNo()%>');"/>
														<br /> 
														<input type="button" value="취소" onclick="toggleCommentStatus(<%= bcomment.getCommentNo() %>, false);"/></td>
											</tr>
											</table>
											
										</div>
									</td>
								</tr>
								<%
									}
								%>
							</table> <!-- ------------ --> <%
 	}
 %>
							<form id="commentform" action="board_comment_write_action.jsp"
								method="post">
								<input type="hidden" name="boardno"
									value="<%=board.getBoardNo()%>" /> <input type="hidden"
									name="pageno" value="<%=pageno%>" />
								<table border="0" cellpadding="0" cellspacing="1">
									<tr>
										<td bgcolor="ffffff" align="left"><textarea
												name="content" rows="1" style="width: 460px"></textarea></td>
										<td bgcolor="ffffff" width="30px"><input type="button"
												value="댓글등록" onClick="writeComment();"> </td>
									</tr>
								</table>
							</form>


							<table border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="글쓰기"
										onClick="boardCreate()"> &nbsp; <input type="button"
										value="답글쓰기" onClick="boardReplyCreate()"> &nbsp; <input
										type="button" value="수정" onClick="boardUpdate()">
										&nbsp; <input type="button" value="삭제" onClick="boardRemove()">
										&nbsp; <input type="button" value="리스트" onClick="boardList()"></td>
								</tr>
							</table>
					</td>
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
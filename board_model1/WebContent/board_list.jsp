<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.util.ListResultBean"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.util.ListPageConfigBean"%>

<%!
public String getTitleString(Board board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getTitle();
		if (t.length() > 15) {
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입

		for (int i = 0; i < board.getDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		if (board.getDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}

		title.append(t.replace(" ", "&nbsp;"));
		return title.toString();
	}
%>

<%
	//1.요청페이지번호	
	request.setCharacterEncoding("UTF-8");
	String pageno = request.getParameter("pageno");
	if (pageno == null || pageno.equals("") || Integer.parseInt(pageno) < 1) {
		pageno = "1";
	}
	//2.한페이지에표시할 게시물수 
	int rowCountPerPage = 10;
	//3.한페이지에보여줄 페이지번호갯수(<< 1 2 3 4 5 >>)
	int pageCountPerPage = 5;
	//페이징(계산)을위한DTO
	ListPageConfigBean pageConfig = new ListPageConfigBean(rowCountPerPage, pageCountPerPage, pageno, "", "");

	//게시물조회
	ListResultBean boardListPage = BoardService.getInstance().findBoardList(pageConfig);
	
	//post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
	if (request.getMethod().toLowerCase().equals("post")) {
		request.setCharacterEncoding("UTF-8");
	}
	String searchValue = request.getParameter("searchValue");
	System.out.println(searchValue);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function boardCreate() {
		location.href = "board_write.jsp";
	}
	function boardSearch() {
		search.action = 'board_list.jsp';
		search.method = 'POST';
		search.submit();
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>게시판-리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">
										♠ 총 <font color="#FF0000"><%=boardListPage.getTotalRecordCount()%></font>건
										| 현재페이지( <font color="#FF0000"><%=boardListPage.getSelectPageNo()%></font>
										/ <font color="#0000FF"><%=boardListPage.getTotalPageCount()%></font>
										)
									</td>
								</tr>
							</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴이</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴날</td>
										<td width=70 align=center bgcolor="E6ECDE">본횟수</td>
									</tr>
									<%
										if (searchValue == null) {
											for (Board board : boardListPage.getList()) {
									%>
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><a
											href='board_view.jsp?boardno=<%=board.getBoardNo()%>&pageno=<%=boardListPage.getSelectPageNo()%>'><%=getTitleString(board)%></a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=board.getWriter()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getRegDate().toString().substring(0, 10)%>
										</td>
										<td width=70 align=center bgcolor="ffffff" align="left"><%=board.getReadCount()%>
										</td>
									</tr>
									<%
										}
										} else {
											for (Board board : boardListPage.getList()) {
												if (getTitleString(board).contains(searchValue)) {
									%>
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><a
											href='board_view.jsp?boardno=<%=board.getBoardNo()%>&pageno=<%=boardListPage.getSelectPageNo()%>'><%=getTitleString(board)%></a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=board.getWriter()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getRegDate().toString().substring(0, 10)%>
										</td>
										<td width=70 align=center bgcolor="ffffff" align="left"><%=board.getReadCount()%>
										</td>
									</tr>
									<%
										}
											}
										}
									%>
								</table>
								<!-- /list -->
							</form> <br>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
										<%
											if (boardListPage.isShowFirst()) {
										%> <a href="./board_list.jsp?pageno=1">◀◀</a>&nbsp; <%
 	}
 %> <%
 	if (boardListPage.isShowPreviousGroup()) {
 %> <a
										href="./board_list.jsp?pageno=<%=boardListPage.getPreviousGroupStartPageNo()%>">◀</a>&nbsp;&nbsp;
										<%
											}
										%> <%
 	for (int i = boardListPage.getStartPageNo(); i <= boardListPage.getEndPageNo(); i++) {
 		if (boardListPage.getSelectPageNo() == i) {
 %> <font color='red'><strong><%=i%></strong></font>&nbsp; <%
 	} else {
 %> <a href="./board_list.jsp?pageno=<%=i%>"> <strong><%=i%></strong></a>&nbsp;
										<%
											}
											}
										%> <%
 	if (boardListPage.isShowNextGroup()) {
 %> <a
										href="./board_list.jsp?pageno=<%=boardListPage.getNextGroupStartPageNo()%>">▶&nbsp;</a>
										<%
											}
										%> <%
 	if (boardListPage.isShowLast()) {
 %> <a
										href="./board_list.jsp?pageno=<%=boardListPage.getTotalPageCount()%>">▶▶</a>&nbsp;
										<%
											}
										%>
									</td>
								</tr>
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<form name="search" method="post">
										<td>검색 : <input type="text" name="searchValue"
											placeholder="검색"> <input type="button"
											value="검색" onclick="boardSearch();" /></td>
									</form>
								</tr>
								<tr>
									<td align="right"><input type="button" value="게시물 생성"
										onclick="boardCreate();" /></td>
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
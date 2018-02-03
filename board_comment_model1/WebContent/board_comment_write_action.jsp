<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.BoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
BoardComment comment = new BoardComment();
comment.setContent(request.getParameter("content"));
comment.setWriter("guest"); 
int boardno =Integer.parseInt(request.getParameter("boardno"));
comment.setBoardNo(boardno); 
//2. 데이터 저장 (DB)
BoardService.getInstance().insertComment(comment);
System.out.println(comment.getBoardNo());
System.out.println(comment.getCommentNo());
System.out.println(comment.getContent());
System.out.println(comment.getWriter()); 
//3. 이동 
response.sendRedirect( "board_view.jsp?boardno=" +boardno + "&pageno=" + request.getParameter("pageno"));
%>
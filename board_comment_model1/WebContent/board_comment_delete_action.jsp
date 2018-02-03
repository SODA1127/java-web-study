<%@page import="com.itwill.board.BoardDao"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.BoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	    //1. 댓글번호 읽어서 변수에 저장
		String commentNoStr = request.getParameter("commentno");
		int commentNo = Integer.parseInt(commentNoStr);
		
		//2. 댓글번호에 해당하는 댓글 삭제
		BoardService.getInstance().deleteComment(commentNo);
		//3. view.action로 이동
		response.sendRedirect(
			"board_view.jsp?" + 
			"boardno=" + request.getParameter("boardno") + 
			"&pageno=" + request.getParameter("pageno"));
%>			
			
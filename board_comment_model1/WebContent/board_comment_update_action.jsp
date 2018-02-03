<%@page import="com.itwill.board.BoardDao"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.BoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//요청 정보에서 내용을 표시할 글번호를 읽고 변수에 저장
	//(없으면 목록으로 이동)
	//1. BoardComment 객체 생성 -> 전송된 데이터를 읽어서 저장
	BoardComment comment = new BoardComment();
	comment.setCommentNo(Integer.parseInt(request.getParameter("commentno")));
	comment.setContent(request.getParameter("content"));

	//2. 데이터베이스 업데이트
	BoardService.getInstance().updateComment(comment);
	//3. board_view.jsp 으로 이동
	response.sendRedirect("board_view.jsp?boardno=" + request.getParameter("boardno") + "&pageno="
			+ request.getParameter("pageno"));
%>

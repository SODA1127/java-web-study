<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
 //post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	request.setCharacterEncoding("UTF-8");
}

//1. Board 객체를 만들고 사용자가 입력한 데이터를 저장
Board board = new Board();
board.setBoardNo(
	Integer.parseInt(request.getParameter("boardno")));
board.setTitle(request.getParameter("title"));
board.setWriter(request.getParameter("writer"));
board.setContent(request.getParameter("content"));

//2. 데이터베이스에 변경된 내용 적용
BoardService.getInstance().update(board);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. boardview.jsp로 이동
response.sendRedirect(
	String.format("board_view.jsp?boardno=%d&pageno=%s",
	board.getBoardNo(), pageno));
%>
    

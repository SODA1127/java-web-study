package com.itwill.board;

// 회원에 관련된 사용자 정의 예외 클래스
public class BoardException extends Exception {
	public BoardException(){
		this("게시판 관련 에러 발생");
	}
	public BoardException(String errorMsg){
		super(errorMsg);
	}
	public BoardException(String errorMsg, Throwable cause){
		super(errorMsg, cause);
	}	
}

package com.itwill.board;

// ȸ���� ���õ� ����� ���� ���� Ŭ����
public class BoardException extends Exception {
	public BoardException(){
		this("�Խ��� ���� ���� �߻�");
	}
	public BoardException(String errorMsg){
		super(errorMsg);
	}
	public BoardException(String errorMsg, Throwable cause){
		super(errorMsg, cause);
	}	
}

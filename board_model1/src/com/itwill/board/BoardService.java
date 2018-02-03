package com.itwill.board;

import java.sql.SQLException;
import java.util.List;

import com.itwill.util.ListPageConfigBean;
import com.itwill.util.ListResultBean;
import com.itwill.util.PageCounter;
public class BoardService {
	private static BoardService _instance;
	private BoardService() {
		
	}
	public static  BoardService getInstance(){
		if(_instance==null){
			_instance=new BoardService();
		}
		return _instance;
	}
	/*
	 * 게시물삭제
	 */
	public int remove(int boardno) throws Exception,BoardException{
		Board tempBoard=getBoardDao().findBoard(boardno);
		boolean rExist=getBoardDao().countReplay(tempBoard);
		System.out.println("답글존재여부:"+rExist);
		if(getBoardDao().countReplay(tempBoard)){
			//답글존재
			throw new BoardException("답글이 있는 게시글은 삭제앙돼요!!");
		}else{
			//답글안존재
			return getBoardDao().remove(tempBoard.getBoardNo());
		}
		
		
	}
	
	/*
	 * 답글쓰기
	 */
	public int createReply(Board board){
		/*
		private int boardNo; 	//원글데이타
		private String title;	//답글데이타
		private String writer;	//답글데이타
		private String content;	//답글데이타
		*/
		return getBoardDao().createReply(board);
		
	}
	/*
	 * 게시물 1개
	 */
	public Board findBoard(int boardNo)throws Exception{
		//getBoardDao().increaseReadCount(boardNo);
		return getBoardDao().findBoard(boardNo);
	}
	public void updateHitCount(int boardNo){
		getBoardDao().increaseReadCount(boardNo);
	}
	/*
	 * 게시물리스트
	 */
	public ListResultBean findBoardList(ListPageConfigBean pageConfig){
		//1.전체글의 갯수
		int totalRecordCount = getBoardDao().getBoardCount();
		//ListResultBean 클래스-->결과데이타 DTO,VO(Board ArrayList + Paging)
		
		//2.paging계산(PageCounter 유틸클래스)
		ListResultBean resultBean= PageCounter.getPagingInfo(
																	Integer.parseInt(pageConfig.getSelectPage()),
																	pageConfig.getRowCountPerPage(),
																	pageConfig.getPageCountPerPage(),
																	totalRecordCount);
		
		//3.게시물데이타 얻기
		List<Board> boardList=
				getBoardDao().findBoardList(resultBean.getStartRowNum(),
											resultBean.getEndRowNum());
		resultBean.setList(boardList);
		
		return resultBean;
	}
	
	
	/*
	 * 게시물생성
	 */
	public int create(Board board){
		return  getBoardDao().create(board);
	}
	/*
	 * 게시물수정
	 */
	public int update(Board board) throws SQLException {
		return getBoardDao().update(board);
	}
	private BoardDao  getBoardDao(){
		return BoardDao.getInstance();
	}
}

package com.itwill.util;

import java.util.*;

import com.itwill.board.Board;

// 리스트 페이지에서 출력에 필요한 테이블 데이터 및 페이징 처리에 필요한 정보빈
public class ListResultBean {
	private List<Board> list; 							// 리스트 데이터 콜렉션
	private int startPageNo; 							// 시작페이지번호
	private int endPageNo; 							// 끝페이지번호
	private int selectPageNo; 						// 선택페이지번호
	private int totalRecordCount; 				// 전체 행수
	private int totalPageCount; 					// 전체 페이지수
	private int previousGroupStartPageNo;	// ◀◀ 이전그룹의 시작페이지번호
	private int nextGroupStartPageNo;			// ▶▶ 다음그룹의 시작페이지번호
	private boolean showPrevious; 				// ◀ 이전페이지 보이기 여부
	private boolean showNext; 					// ▶︎ ︎다음페이지 보이기 여부
	private boolean showPreviousGroup;		// 이전그룹 보이기 여부
	private boolean showNextGroup;  			// 다음그룹 보이기 여부
	private boolean showFirst; 					// 처음으로 보이기 여부
	private boolean showLast; 					// 마지막으로 보이기 여부
	
	// DB SELECT 변수
	private int startRowNum;
	private int endRowNum;

	public ListResultBean() {
	}

	public ListResultBean(List<Board> list, int startPageNo, int endPageNo,
			int selectPageNo, int totalRecordCount, int totalPageCount,
			int previousGroupStartPageNo, int nextGroupStartPageNo,
			boolean showPrevious, boolean showNext, boolean showPreviousGroup,
			boolean showNextGroup, boolean showFirst, boolean showLast,
			int startRowNum, int endRowNum) {
		this.list = list;
		this.startPageNo = startPageNo;
		this.endPageNo = endPageNo;
		this.selectPageNo = selectPageNo;
		this.totalRecordCount = totalRecordCount;
		this.totalPageCount = totalPageCount;
		this.previousGroupStartPageNo = previousGroupStartPageNo;
		this.nextGroupStartPageNo = nextGroupStartPageNo;
		this.showPrevious = showPrevious;
		this.showNext = showNext;
		this.showPreviousGroup = showPreviousGroup;
		this.showNextGroup = showNextGroup;
		this.showFirst = showFirst;
		this.showLast = showLast;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public List<Board> getList() {
		return list;
	}

	public void setList(List<Board> list) {
		this.list = list;
	}

	public int getNextGroupStartPageNo() {
		return nextGroupStartPageNo;
	}

	public void setNextGroupStartPageNo(int nextGroupStartPageNo) {
		this.nextGroupStartPageNo = nextGroupStartPageNo;
	}
	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCountCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPreviousGroupStartPageNo() {
		return previousGroupStartPageNo;
	}

	public void setPreviousGroupStartPageNo(int previousGroupStartPageNo) {
		this.previousGroupStartPageNo = previousGroupStartPageNo;
	}

	


	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}

	public boolean isShowFirst() {
		return showFirst;
	}

	public void setShowFirst(boolean showFirst) {
		this.showFirst = showFirst;
	}

	public boolean isShowLast() {
		return showLast;
	}

	public void setShowLast(boolean showLast) {
		this.showLast = showLast;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public boolean isShowNextGroup() {
		return showNextGroup;
	}

	public void setShowNextGroup(boolean showNextGroup) {
		this.showNextGroup = showNextGroup;
	}

	public boolean isShowPrevious() {
		return showPrevious;
	}

	public void setShowPrevious(boolean showPrevious) {
		this.showPrevious = showPrevious;
	}

	public boolean isShowPreviousGroup() {
		return showPreviousGroup;
	}

	public void setShowPreviousGroup(boolean showPreviousGroup) {
		this.showPreviousGroup = showPreviousGroup;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

}

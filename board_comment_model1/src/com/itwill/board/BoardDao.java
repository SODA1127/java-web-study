package com.itwill.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * �ڷ�� �Խ��ǿ��� �����ͺ��̽��� ������ �����ϴ� Ŭ����. BOARD, BOARDFILE ���̺���� ������ ����Ѵ�.
 */
public class BoardDao extends RdbmsDao {
	private static BoardDao _instance;

	private BoardDao() {
		System.out.println("BoardDao������");
	}

	public static BoardDao getInstance() {
		if (_instance == null) {
			_instance = new BoardDao();
		}
		return _instance;
	}

	/**
	 * ���ο� �Խù��� �߰��ϴ� �޽��.
	 */
	public int create(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO Board " + "(boardno, title, writer, content, groupno, step)"
					+ "VALUES (board_sequence.nextval, ?, ?, ?, " + "board_sequence.currval, 1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			// 4. ��� ����
			int result = pstmt.executeUpdate();
			// 5. ��� ������ ��� ó��
			return result;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 6. ����ݱ�
			releaseConnection(conn);
		}
		return 0;
	}

	/**
	 * ��� �Խù��� �߰��ϴ� �޽��
	 */
	public int createReply(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			// ����� �ۼ��� ������ ������ ��ȸ
			Board temp = findBoard(board.getBoardNo());

			// ������ �޴� ���� �۵��� ������ ���� ��ȣ ����
			conn = getConnection();
			String sql = "UPDATE board " + "SET step = step + 1 " + "WHERE step > ? AND groupno = ?";
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, temp.getStep());// step ��ȣ
			pstmt.setInt(2, temp.getGroupNo());// group ��ȣ
			pstmt.executeUpdate();
			pstmt.close();

			// ��� ����
			sql = "INSERT INTO board " + "(boardno, title, writer, content, " + "groupno, step, depth) "
					+ "VALUES (board_sequence.nextVal, ?, ?, ?," + "?, ?, ?)";
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());// ����
			pstmt.setString(2, board.getWriter());// �ۼ���
			pstmt.setString(3, board.getContent());// ����
			pstmt.setInt(4, temp.getGroupNo());// groupno
			pstmt.setInt(5, temp.getStep() + 1);// step
			pstmt.setInt(6, temp.getDepth() + 1);// depth

			count = pstmt.executeUpdate();
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}
		}
		return count;

	}

	/**
	 * �Խù� ����Ʈ�� ��ȯ(�Խù����۹�ȣ,�Խù�����ȣ)
	 */
	public ArrayList<Board> findBoardList(int start, int last) {
		// System.out.println("" + start + " ~ " + last);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;// ��ȸ ����� �����ϴ� ���� ����
		// �����ͺ��̽��� �����͸� �о ������ ��ü �÷���
		ArrayList<Board> boards = new ArrayList<Board>();

		try {
			conn = getConnection();
			StringBuffer sql = new StringBuffer(500);
			sql.append("SELECT * ");
			sql.append("FROM ");

			sql.append("( ");
			sql.append("	SELECT ");
			sql.append("		rownum idx, s.* ");
			sql.append("	FROM ");

			sql.append("	( ");
			sql.append("		SELECT ");
			sql.append("			boardno, title, writer, ");
			sql.append("			regdate, readcount, ");
			sql.append("			groupno, step, depth ");
			sql.append("		FROM ");
			sql.append("			board ");
			sql.append("		ORDER BY groupno DESC, step ASC ");
			sql.append("	) s ");

			sql.append(") ");

			sql.append("WHERE idx >= ? AND idx <= ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(2));
				board.setTitle(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setGroupNo(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));

				boards.add(board);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 6. ����ݱ�
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (conn != null)
				try {
					releaseConnection(conn);
				} catch (Exception ex) {
				}
		}
		// System.out.println(boards);
		return boards;
	}

	/*
	 * 
	 * 
	 */
	/**
	 * �亯�Խù� ���翩��Ȯ�θ޽��
	 */
	public boolean countReplay(Board board) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean isExist = false;
		int cnt = 0;
		try {
			conn = getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT ");
			sql.append("count(*) cnt ");
			sql.append("FROM board ");
			sql.append("WHERE groupno = ? ");
			sql.append("AND depth >= ? ");
			sql.append("AND step >= ? ");
			sql.append("ORDER BY step,depth ASC");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board.getGroupNo());
			pstmt.setInt(2, board.getDepth());
			pstmt.setInt(3, board.getStep());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			if (cnt > 1) {
				isExist = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					releaseConnection(conn);
			} catch (Exception ex) {
			}
		}
		return isExist;

	}

	/**
	 * �Խù��� �����ϴ� �޽��.
	 */
	public int remove(int boardNo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = getConnection();
			String sql = "DELETE board WHERE boardno = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			count = pstmt.executeUpdate();
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}
		}
		return count;

	}

	/**
	 * �Խù������� �����ϴ� �޽��.
	 */
	public int update(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE board " + "SET title = ?, content = ? " + "WHERE boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBoardNo());
			count = pstmt.executeUpdate();
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}

	/**
	 * �Խù� ��ȣ�� �ش��ϴ� �Խù� ������ ��ȯ�ϴ� �޽��.
	 */
	public Board getBoardByBoardNo(int number) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null, rs2 = null;
		Board board = null;

		try {
			conn = getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT ");
			sql.append("boardno, title, writer, content, ");
			sql.append("regdate, readcount, ");
			sql.append("deleted, groupno, step, depth ");
			sql.append("FROM board ");
			sql.append("WHERE boardno = ? AND deleted = '0'");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setDeleted(rs.getBoolean(7));
				board.setGroupNo(rs.getInt(8));
				board.setStep(rs.getInt(9));
				board.setDepth(rs.getInt(10));

				sql.delete(0, sql.length());
				sql.append("SELECT commentno, boardno, ").append("	   writer, content, regdate ")
						.append("FROM boardcomment ").append("WHERE boardno = ?");
				pstmt2 = conn.prepareStatement(sql.toString());
				pstmt2.setInt(1, number);
				rs2 = pstmt2.executeQuery();
				ArrayList<BoardComment> comments = new ArrayList<BoardComment>();
				while (rs2.next()) {
					BoardComment comment = new BoardComment();
					comment.setCommentNo(rs2.getInt(1));
					comment.setBoardNo(rs2.getInt(2));
					comment.setWriter(rs2.getString(3));
					comment.setContent(rs2.getString(4));
					comment.setRegDate(rs2.getDate(5));
					comments.add(comment);
				}
				board.setComments(comments);

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs2 != null)
					rs2.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt2 != null)
					pstmt2.close();
			} catch (Exception ex) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}
		}
		return board;
	}

	public Board findBoard(int boardNo) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		Board board = null;

		try {
			conn = getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT ");
			sql.append("boardno, title, writer, content, ");
			sql.append("regdate, readcount, ");
			sql.append("groupno, step, depth ");
			sql.append("FROM board ");
			sql.append("WHERE boardno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setGroupNo(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));
				
				sql.delete(0, sql.length());
				sql.append("SELECT commentno, boardno, ")
				   .append("	   writer, content, regdate ")
				   .append("FROM boardcomment ").append("WHERE boardno = ?");
				pstmt2 = conn.prepareStatement(sql.toString());
				pstmt2.setInt(1, boardNo);
				rs2 = pstmt2.executeQuery();
				ArrayList<BoardComment> comments = new ArrayList<BoardComment>();
				while (rs2.next()) {
					BoardComment comment = new BoardComment();
					comment.setCommentNo(rs2.getInt(1));
					comment.setBoardNo(rs2.getInt(2));
					comment.setWriter(rs2.getString(3));
					comment.setContent(rs2.getString(4));
					comment.setRegDate(rs2.getDate(5));
					comments.add(comment);
				}
				board.setComments(comments);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					releaseConnection(conn);
			} catch (Exception ex) {
			}
		}
		return board;

	}

	/**
	 * �Խù� ��ȸ���� 1 ����.
	 */
	public void increaseReadCount(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "UPDATE board " + "SET readcount = readcount + 1 " + "WHERE boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					releaseConnection(conn);
			} catch (Exception ex) {
			}
		}
	}

	/**
	 * �Խù� �� �Ǽ��� ��ȸ, ��ȯ
	 */
	public int getBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = getConnection();
			String sql = "SELECT COUNT(*) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);

		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					releaseConnection(conn);
			} catch (Exception ex) {
			}
		}
		return count;
	}

	public void insertComment(BoardComment comment) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			String sql = "INSERT INTO boardcomment" + "(commentno,boardno, writer, content) "
					+ "VALUES (boardcomment_sequence.nextval,?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println(comment.getBoardNo());
			System.out.println(comment.getWriter());
			System.out.println(comment.getContent());
			pstmt.setInt(1, comment.getBoardNo());
			pstmt.setString(2, comment.getWriter());
			pstmt.setString(3, comment.getContent());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception ex) {
				}
		}
	}

	public void deleteComment(int commentNo) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			String sql = "DELETE FROM boardcomment " + "WHERE commentno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception ex) {
				}
		}
	}

	public void updateComment(BoardComment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			String sql = "UPDATE boardcomment " + "SET content = ?" + "WHERE commentno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getContent());
			pstmt.setInt(2, comment.getCommentNo());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception ex) {
				}
		}

	}
}

package com.itwill.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.itwill.user.common.ConnectionPool;
import com.itwill.user.common.UserSQL;

/*
 사용자관리에서 데이타베이스와의 작업을 전담하는 클래스
 USERINFO 테이블에 사용자를 추가,삭제,검색,수정등의 작업을한다.
 */
public class UserDao {
	/*
	 * singleton 기법
	 */
	/*
	 * private static UserDao _userDao;
	 * 
	 * private UserDao() { System.out.println("UserDao생성자:" + this); }
	 * 
	 * public static UserDao getUserDao() {
	 * 
	 * if (_userDao == null) { _userDao = new UserDao(); } return _userDao; }
	 */

	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	public int create(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = UserSQL.INSERT_USERINFO;
		try {
			/*
			 * Connection 얻기
			 */
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null) {
				/*
				 * Connection 필반납
				 */
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}
	}

	/*
	 * 기존의 사용자정보를 수정
	 */
	public int update(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = UserSQL.UPDATE_USERINFO;
		try {
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getUserId());
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null) {
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}
	}

	/*
	 * 사용자아이디에해당하는 사용자를 삭제
	 */
	public int remove(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String removeQuery = UserSQL.REMOVE_USERINFO;
		try {
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(removeQuery);
			pstmt.setString(1, userId);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null) {
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}
	}

	/*
	 * 사용자아이디(PK)에 해당하는 정보를 데이타베이스에서 찾아서
	 * User 도메인클래스에 저장하여 반환
	 */
	public User findUser(String userId) throws Exception {
		User user = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = UserSQL.USER_SELECT_BY_ID;
		try {
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User(
						rs.getString("userid"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("email"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null) {
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}
		return user;
	}

	/*
	 * 모든사용자 정보를 데이타베이스에서 찾아서 List<User> 콜렉션 에 저장하여 반환
	 */
	public List<User> findUserList() throws Exception {
		ArrayList<User> userList = new ArrayList<User>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = UserSQL.USER_SELECT_ALL;
		try {
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userList.add(new User(rs.getString("userid"), rs.getString("password"), rs.getString("name"),
						rs.getString("email")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null) {
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}
		return userList;
	}

	/*
	 * 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를판별
	 */
	public boolean existedUser(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String existedQuery = UserSQL.CHECK_USER_BY_ID;
		try {
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(existedQuery);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			int count = 0;
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
			if (count == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null) {
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}

	}

}

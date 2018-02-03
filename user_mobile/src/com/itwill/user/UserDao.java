package com.itwill.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.itwill.db.RdbmsDao;

/*
 ����ڰ������� ����Ÿ���̽����� �۾��� �����ϴ� Ŭ����
 USERINFO ���̺� ����ڸ� �߰�,����,�˻�,�������� �۾����Ѵ�.
 */
public class UserDao extends RdbmsDao {
	/*
	 * singleton ���
	 */
	private static UserDao _userDao;

	private UserDao() {
		System.out.println("UserDao������:" + this);
	}

	public static UserDao getUserDao() {

		if (_userDao == null) {
			_userDao = new UserDao();
		}
		return _userDao;
	}

	/*
	 * ����ڰ������̺� ���ο����ڻ���
	 */
	public int create(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into userinfo values(?,?,?,?)";
		try {
			con = getConnection();
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
			if (con != null)
				releaseConnection(con);
		}
	}

	/*
	 * ������ ����������� ����
	 */
	public int update(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update userinfo set password=?,name=?,email=? where userid=?";
		try {
			con = getConnection();
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
			if (con != null)
				releaseConnection(con);
		}
	}

	/*
	 * ����ھ��̵��ش��ϴ� ����ڸ� ����
	 */
	public int remove(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String removeQuery = "delete from userinfo where userid=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(removeQuery);
			pstmt.setString(1, userId);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}
	
	/*
	 * ����ھ��̵��ش��ϴ� ������ ����Ÿ���̽����� ã�Ƽ�
	 * User ������Ŭ������ �����Ͽ� ��ȯ
	 */
	public User findUser(String userId) throws Exception {
		User user = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select userid,password,name,email from userinfo where userid=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User(rs.getString("userid"),
						rs.getString("password"), rs.getString("name"),
						rs.getString("email"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return user;
	}
	/*
	 * ������� ������ ����Ÿ���̽����� ã�Ƽ� 
	 * List<User> �ݷ��� �� �����Ͽ� ��ȯ
	 */
	public List<User> findUserList() throws Exception {
		ArrayList<User> userList= new ArrayList<User>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select userid,password,name,email from userinfo";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userList.add(new User(
						rs.getString("userid"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("email")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return userList;
	}
	/*
	 * ���ڷ� ���޵Ǵ� ���̵� ������ ����ڰ� �����ϴ����� ���θ��Ǻ�
	 */
	public boolean existedUser(String userId)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String existedQuery="select count(*) cnt from userinfo" +
							" where userid=?";
		try{
			con=getConnection();
			pstmt=con.prepareStatement(existedQuery);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			int count=0;
			if(rs.next()){
				count=rs.getInt("cnt");
			}
			if(count==1){
				return true;
			}else{
				return false;
			}
		}finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				releaseConnection(con);
		}
		
	}
	
}















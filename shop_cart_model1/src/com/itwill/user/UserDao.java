package com.itwill.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 사용자관리에서 데이타베이스와의 작업을 전담하는 클래스
 USERINFO 테이블에 사용자를 추가,삭제,검색,수정등의 작업을한다.
 */
public class UserDao{
	public UserDao() {
		System.out.println("UserDao생성자:"+this);
	}

	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	public int create(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into userinfo values(?,?,?,?)";
		try {
			con = this.getConnection();
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
				this.releaseConnection(con);
		}
	}

	/*
	 * 기존의 사용자정보를 수정
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
	 * 사용자아이디에해당하는 사용자를 삭제
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
	 * 사용자아이디에해당하는 정보를 데이타베이스에서 찾아서
	 * User 도메인클래스에 저장하여 반환
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
	 * 모든사용자 정보를 데이타베이스에서 찾아서 
	 * List<User> 콜렉션 에 저장하여 반환
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
	 * 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를판별
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
	/************Connection 얻고반납하는메쏘드*************/
	public Connection getConnection(){
		InitialContext ic;
		DataSource ds;
		Connection con=null;
		try{
			ic=new InitialContext();
			ds=(DataSource)ic.lookup("java:/comp/env/jdbc/OracleDB");
			con=ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	public void releaseConnection(Connection con){
		
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	/**********************************************/
	
}















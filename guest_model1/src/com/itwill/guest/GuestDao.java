package com.itwill.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GuestDao extends RdbmsDao {
	/*
	 * READ ALL
	 */
	public ArrayList<Guest> selectAll() throws Exception {
		ArrayList<Guest> guestList = new ArrayList<Guest>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = this.getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_SELECT_ALL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				guestList.add(new Guest(rs.getInt("guest_no"), rs.getString("guest_name"), rs.getString("guest_date"),
						rs.getString("guest_email"), rs.getString("guest_homepage"), rs.getString("guest_title"),
						rs.getString("guest_content")));
			}
		}finally{
			if(rs!=null){
				rs.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(con!=null){
				this.releaseConnection(con);
			}
		}
		return guestList;
	}

	/*
	 * CREATE
	 */
	public boolean insertGuest(Guest guest) throws Exception{
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_INSERT);
			pstmt.setString(1, guest.guest_name);
			pstmt.setString(2, guest.guest_email);
			pstmt.setString(3, guest.guest_homepage);
			pstmt.setString(4, guest.guest_title);
			pstmt.setString(5, guest.guest_content);
			int insertRowCount = pstmt.executeUpdate();
			if (insertRowCount == 1) {
				isSuccess = true;
			}

		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		} finally {
			if(pstmt!=null){
				pstmt.close();
			}
			if (con != null)
				releaseConnection(con);
		}

		return isSuccess;
	}

	/*
	 * READ ONE
	 */
	public Guest selectByNo(int no) throws Exception {
		Guest guest = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_SELECT_BY_NO);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				guest = new Guest(rs.getInt("guest_no"), rs.getString("guest_name"), rs.getString("guest_date"),
						rs.getString("guest_email"), rs.getString("guest_homepage"), rs.getString("guest_title"),
						rs.getString("guest_content"));
			}
		} finally {
			if (con != null)
				releaseConnection(con);
		}
		return guest;
	}

	/*
	 * DELETE
	 */
	public boolean deleteGuest(int no){
		boolean deleteOK = false;
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con = this.getConnection();
			pstmt=con.prepareStatement(GuestSQL.GUEST_DELETE);
			pstmt.setInt(1, no);
			int deleteRowCount = pstmt.executeUpdate();
			if(deleteRowCount==1){
				deleteOK=true;
			}else{
				deleteOK=false;
			}
		}catch(Exception e){
			deleteOK=false;
			e.printStackTrace();
		}finally {
			if(con!=null){
				try {
					this.releaseConnection(con);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return deleteOK;
	}

	/*
	 * UPDATE
	 */
	public boolean updateGuest(Guest updateGuest) throws Exception{
		boolean updateOK = true;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_UPDATE);
			pstmt.setString(1, updateGuest.guest_name);
			pstmt.setString(2, updateGuest.guest_email);
			pstmt.setString(3, updateGuest.guest_homepage);
			pstmt.setString(4, updateGuest.guest_title);
			pstmt.setString(5, updateGuest.guest_content);
			pstmt.setInt(6, updateGuest.getGuest_no());
			int insertRowCount = pstmt.executeUpdate();
			if (insertRowCount == 1) {
				updateOK = true;
			}

		} catch (Exception e) {
			updateOK = false;
			e.printStackTrace();
		} finally {
			if(pstmt!=null){
				pstmt.close();
			}
			if (con != null)
				releaseConnection(con);
		}
		
		return updateOK;
	}

}

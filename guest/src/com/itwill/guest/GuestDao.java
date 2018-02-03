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

		con = this.getConnection();
		pstmt = con.prepareStatement(GuestSQL.GUEST_SELECT_ALL);
		rs = pstmt.executeQuery();
		try {
			while (rs.next()) {
				guestList.add(new Guest(rs.getInt("guest_no"), rs.getString("guest_name"), rs.getString("guest_date"),
						rs.getString("guest_email"), rs.getString("guest_homepage"), rs.getString("guest_title"),
						rs.getString("guest_content")));
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				this.releaseConnection(con);
			}
		}
		return guestList;
	}

	/*
	 * CREATE
	 */
	public boolean insertGuest(Guest guest) throws Exception {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_INSERT);
			pstmt.setString(1, guest.getGuest_name());
			pstmt.setString(2, guest.getGuest_email());
			pstmt.setString(3, guest.getGuest_homepage());
			pstmt.setString(4, guest.getGuest_title());
			pstmt.setString(5, guest.getGuest_content());
			int insertRowCount = pstmt.executeUpdate();
			if (insertRowCount == 1) {
				isSuccess = true;
			}

		} catch (Exception e) {
			isSuccess = false;
		} finally {
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
	public boolean deleteGuest(int no) throws Exception {
		boolean deleteOK = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_DELETE);
			pstmt.setInt(1, no);
			int a = pstmt.executeUpdate();
			if (a == 1) {
				deleteOK = true;
			} else {
				deleteOK = false;
			}
		} finally {
			if (con != null)
				releaseConnection(con);
		}
		return deleteOK;
	}

	/*
	 * UPDATE
	 */
	public boolean updateGuest(Guest updateGuest) throws Exception {
		boolean updateOK = true;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_UPDATE);
			pstmt.setString(1, updateGuest.getGuest_name());
			pstmt.setString(2, updateGuest.getGuest_email());
			pstmt.setString(3, updateGuest.getGuest_homepage());
			pstmt.setString(4, updateGuest.getGuest_title());
			pstmt.setString(5, updateGuest.getGuest_content());
			pstmt.setInt(6, updateGuest.getGuest_no());
			int a = pstmt.executeUpdate();
			if (a == 1) {
				updateOK = true;
			} else {
				updateOK = false;
			}
		} finally {
			if (con != null)
				releaseConnection(con);
		}
		return updateOK;
	}

}

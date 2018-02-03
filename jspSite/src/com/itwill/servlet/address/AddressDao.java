package com.itwill.servlet.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.itwill.servlet.common.ConnectionFactory;

public class AddressDao {
	
	public int insert(Address address) throws Exception {
		System.out.println("===========삽입시작===========");
		
		Connection con = ConnectionFactory.getConection();
		System.out.println("1. Connection : " + con);
		PreparedStatement pstmt =con.prepareStatement(AddressSQL.INSERT_ADDRESS);
		pstmt.setInt(1, address.getNo());
		pstmt.setString(2, address.getId());
		pstmt.setString(3, address.getName());
		pstmt.setString(4, address.getPhone());
		pstmt.setString(5, address.getAddress());
		
		int insertRowCount = pstmt.executeUpdate();
		System.out.println("rowCount : " + insertRowCount);
		System.out.println("===========삽입완료===========");
		pstmt.close();
		return insertRowCount;
		
	}
	
	public void update(Address address) throws Exception {
		System.out.println("===========업데이트 시작===========");
		Connection con = ConnectionFactory.getConection();
		System.out.println("1. Connection : " + con);
		PreparedStatement pstmt = con.prepareStatement(AddressSQL.UPDATE_ADDRESS);
		pstmt.setString(1, address.getId());
		pstmt.setString(2, address.getName());
		pstmt.setString(3, address.getPhone());
		pstmt.setString(4, address.getAddress());
		pstmt.setInt(5, address.getNo());
		int updateRowCount = pstmt.executeUpdate();
		System.out.println("rowCount : " + updateRowCount);	
		System.out.println("===========업데이트 완료===========");
		pstmt.close();
	}
	
	public Address selectByNo(int findNo) throws Exception{
		int no = 0;
		String id = "";
		String name = "";
		String phone = "";
		String address = "";
		System.out.println("===========" + findNo +"번행 찾기===========");
		Connection con = ConnectionFactory.getConection();
		System.out.println("1. Connection : " + con);
		PreparedStatement pstmt = con.prepareStatement(AddressSQL.SELECT_ADDRESS);
		pstmt.setInt(1, findNo);
		ResultSet rs = pstmt.executeQuery();
		boolean isExist = rs.next();
		if(isExist) {
			no = rs.getInt("no");
			id = rs.getString("id");
			name = rs.getString("name");
			phone = rs.getString("phone");
			address = rs.getString("address");
			System.out.println("===========" + no + "번 데이터 탐색 ===========");
			//System.out.println(no + "\t" + id + "\t" + name + "\t" + phone + "\t" + address);
		} else {
			System.out.println("no data!!");
		}
		
		Address getAddress = new Address(no, id, name, phone, address);
		
		pstmt.close();
		return getAddress;
	}
	
	public ArrayList<Address> selectAll() throws Exception {
		ArrayList<Address> addressList = new ArrayList<>();
		System.out.println("===========모두찾기===========");
		Connection con = ConnectionFactory.getConection();
		System.out.println("1. Connection : " + con);
		PreparedStatement pstmt = con.prepareStatement(AddressSQL.SELECT_ALL_ADDRESS);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			int no = rs.getInt("no");
			String id = rs.getString("id");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String address = rs.getString("address");
			//System.out.println(no + "\t" + id + "\t" + name + "\t" + phone + "\t" + address);
			Address getAddress = new Address(no, id, name, phone, address);
			addressList.add(getAddress);
		}
		System.out.println("===========셀렉팅 완료===========");
		pstmt.close();
		return addressList;
	}
	
	public void deleteByNo(int no) throws Exception{
		System.out.println("===========" + no + "번호 행삭제===========");
		Connection con = ConnectionFactory.getConection();
		System.out.println("1. Connection : " + con);

		PreparedStatement pstmt = con.prepareStatement(AddressSQL.DELETE_BYNO_ADDRESS);
		pstmt.setInt(1, no);
		int deleteRowCount = pstmt.executeUpdate();
		System.out.println("rowCount : " + deleteRowCount);		

		System.out.println("===========삭제완료===========");
		pstmt.close();
	}
	
}

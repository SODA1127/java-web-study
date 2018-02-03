package com.itwill.servlet.address;

public class AddressSQL {
	public final static String INSERT_ADDRESS = "insert into address values(?, ?, ?, ?, ?)";
	public final static String UPDATE_ADDRESS = "update address set id= ?, name= ?, phone= ?, address= ? where no = ?";
	public final static String SELECT_ADDRESS = "select no, id, name, phone, address from address where no = ?"; 
	public final static String SELECT_ALL_ADDRESS = "select no, id, name, phone, address from address order by no";
	public final static String DELETE_BYNO_ADDRESS = "delete from address where no = ?";
}

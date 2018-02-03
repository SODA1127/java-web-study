package com.itwill.test;
import java.sql.*;
public class BatchUpdateBoardMain 
{
	public static void main(String[] args) 
	{
		Connection con=null;
		Statement stmt=null;
		try{
		 con=ConnectionFactory.getConnection();
		 stmt=con.createStatement(
			 ResultSet.TYPE_SCROLL_SENSITIVE,
			 ResultSet.CONCUR_UPDATABLE);
		 con.setAutoCommit(false);

		 for(int i=0;i<=560;i++){
			stmt.addBatch(		
					"INSERT INTO board (boardno, title, writer, content, groupno, step)"
					+ " VALUES ("
					+ "board_sequence.nextval,"
					+ "'�Խ���Ÿ��Ʋ'||board_sequence.currval ,"
					+ "'���ȣ'||board_sequence.currval,"
					+ "'content'||board_sequence.currval,"
					+ "board_sequence.currval,"
					+ "1)"
			);
			
		 }
		 int[] updateCounts = stmt.executeBatch();
		 System.out.println("query ��:"+updateCounts.length);
		 con.commit();
		 System.out.println("success commit!!!!");
		}catch(SQLException e){
			e.printStackTrace();
			try{
				con.rollback();
				System.out.println("rollback !!!");
			}catch(SQLException e1){
				System.out.println("rollback fail!!!");
			}
		}finally{
			try{
				if(con!=null){
					con.close();
				}
			}catch(SQLException e){
				System.out.println("close �� �����߻�");
			}
		}

	}
}

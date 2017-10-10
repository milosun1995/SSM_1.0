package org.blog.milo.utils;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DBUtil {

	
	public Connection conn() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=(com.mysql.jdbc.Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_shiro", "root", "root");
		return conn;
	}		
	
	
	public void closeConn(Connection conn) throws SQLException{
		if(conn!=null){
			conn.close();
		}
	}
	
	public static void main(String[] args) {
		DBUtil dbUtil=new DBUtil();
		try {
			dbUtil.conn();
			System.out.println("Connection succeeded! ");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection failed !");
		}
	}
	
}

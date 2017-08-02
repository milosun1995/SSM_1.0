package com.milosun.mysql.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;

import org.junit.experimental.results.ResultMatchers;


public class MetaDemo {
	private static final String DBDRIVER="com.mysql.jdbc.Driver";
	private static final String DBURL="jdbc:mysql://127.0.0.1:3306/db_dao_factory";
	private static final String DBUSER="root";
	private static final String DBPASSWORD="root";
	
	public static void main(String[] args) throws Exception{
		Class.forName(DBDRIVER);
		Connection conn=DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		
		String sql="SELECT mid,name,age,phone,birthday,note FROM T_MEMBER";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSetMetaData metaData=pstmt.getMetaData();
		System.out.println(metaData.getColumnCount());
		System.out.println(metaData.getColumnLabel(1));
		System.out.println(metaData.getColumnLabel(2));
		System.out.println(metaData.getColumnLabel(3));
		System.out.println(metaData.getColumnLabel(4));
		System.out.println(metaData.getColumnLabel(5));
		System.out.println(metaData.getColumnLabel(6));
		conn.close(); 
		
	}
}

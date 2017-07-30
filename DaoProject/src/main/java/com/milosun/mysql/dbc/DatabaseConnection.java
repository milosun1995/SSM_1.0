package com.milosun.mysql.dbc;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DatabaseConnection {

	private static final String DBDRIVER="com.mysql.jdbc.Driver";
	private static final String DBURL="jdbc:mysql://127.0.0.1:3306/db_dao_factory";
	private static final String DBUSER="root";
	private static final String DBPASSWORD="root";
	public Connection conn;
	
	/**
	 * 负责数据库的链接控制
	 */
	public DatabaseConnection() {
		try {
			Class.forName(DBDRIVER);
			this.conn=(Connection) DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 取得Connection的实例化对象
	 * @return Connection的实例化对象，如果连接失败返回null
	 */
	public Connection getConnection() {
		return this.conn;
	}
	
	/**
	 * 负责关闭数据库连接
	 */
	public void close() {
		if(this.conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 测试连接数据库是否连接成功
	 * @param args
	 */
	public static void main(String[] args) {
		DatabaseConnection databaseConnection=new DatabaseConnection();
		try {
			databaseConnection.getConnection();
			System.out.println("连接数据库成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("连接数据库失败！");
		}
		
	}

}

package com.milosun.mysql.dbc;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DatabaseConnection {

	private static final String DBDRIVER="com.mysql.jdbc.Driver";
	private static final String DBURL="jdbc:mysql://127.0.0.1:3306/db_dao_factory";
	private static final String DBUSER="root";
	private static final String DBPASSWORD="root";
	private static ThreadLocal<Connection> threadLocal=new ThreadLocal<Connection>();
	private DatabaseConnection() {}
	/**
	 *  获取一个Connection 接口对象
	 * @return Connection 对象
	 */
	private static Connection rebuildConnection() {
		try {
			Class.forName(DBDRIVER);
			return (Connection) DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	/**
	 * 取得Connection的对象,是通过ThreadLocal类对象取得，每一个线程存放自己的对象
	 * @return 返回一个连接对象
	 */
	public static Connection getConnection() {
		Connection conn=threadLocal.get(); //取得一个Connection
		
		if(conn==null) { //表示现在还没有常见Connection，ThreadLocal没有保存数据
			conn=rebuildConnection(); //建立新的数据库连接对象
			threadLocal.set(conn); //保存对象
		}
		return conn;
	}
	
	/**
	 * 负责关闭数据库连接
	 */
	public static void close() {
		Connection conn=threadLocal.get(); //取得一个Connection
		if(conn!=null) {//现在还有连接对象
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			threadLocal.remove();// 清空ThreadLocal原本的数据内容
		}
	}
	
	/**
	 * 测试连接数据库是否连接成功
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			DatabaseConnection.getConnection();
			System.out.println("连接数据库成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("连接数据库失败！");
		}
		
	}

}

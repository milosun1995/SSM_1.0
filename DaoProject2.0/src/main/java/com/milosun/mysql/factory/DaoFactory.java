package com.milosun.mysql.factory;

import java.lang.reflect.Constructor;
import java.sql.Connection;

/**
 * 取得DAO接口的工厂类 
 * @author MILO
 *
 */
public class DaoFactory {
	private DaoFactory() {}
	/**
	 * 定义DAO接口的对象取得
	 * @param cls 子类的Class对象
	 * @param conn 一个借口的实例化对象
	 * @return
	 */
	public static <T> T getInstance(Class<T> cls) {
		try {
			return cls.newInstance();
		} catch (Exception e) {
		e.printStackTrace();
		}
		return null;
	}
}

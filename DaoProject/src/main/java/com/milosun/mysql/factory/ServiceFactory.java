package com.milosun.mysql.factory;

public class ServiceFactory {
	public ServiceFactory() {}
	 public static  <T> T getInstance(Class<T> cls) {
		 try {
			return cls.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	 }
}

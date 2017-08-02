package com.milosun.mysql.factory;

import com.milosun.mysql.service.proxy.ServiceProxy;

public class ServiceFactory {
	public ServiceFactory() {}
	 public static  <T> T getInstance(Class<T> cls) {
		 try {
			return new ServiceProxy().bind(cls);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	 }
}

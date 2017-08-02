package com.milosun.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Resource {
	/**
	 * 禁止实例化对象访问
	 */
	private Resource() {}
	
	/**
	 * 获取src路径下的.properties文件
	 * @param className 全类名，如:"com.milosun.mysql.vo.Member",根据这个全类名，或得该类的主键
	 * @return 返回全类名对应的主键名称
	 * @throws Exception
	 */
	public static String getId(String className){
			Properties pro=new Properties();
			InputStream is = Resource.class.getClassLoader().getResourceAsStream("Primary.properties");  
	        try {
				pro.load(is);
			} catch (IOException e) {
				e.printStackTrace();
			}  
			return pro.getProperty(className);
	}
	
	/**
	 * 测试获取指定properties文件中的指定全类名对应的value
	 * @param args
	 * @throws Throwable
	 */
	public static void main(String[] args) throws Throwable {
		System.out.println(Resource.getId("com.milosun.mysql.vo.Member"));
	}
}

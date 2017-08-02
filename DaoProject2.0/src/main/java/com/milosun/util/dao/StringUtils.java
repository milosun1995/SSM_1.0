package com.milosun.util.dao;

public class StringUtils {
	public static String initcap(String str){
		if(str==null || "".equals(str)) {
			return str;
		}
			return str=str.substring(0, 1).toUpperCase()+str.substring(1);
	}
	
	public static void main(String[] args) {
		System.out.println(StringUtils.initcap("mid"));
	}
}

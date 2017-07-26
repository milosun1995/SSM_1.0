package org.ssm.utils;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

public class CryptographyUtil {
	/**
	 * 加密
	 * @param str
	 * @return
	 */
	public static String encBase64(String str) {
		return Base64.encodeToString(str.getBytes());
	}
	
	/**
	 * 解密
	 * @param str
	 * @return
	 */
	public static String decBase64(String str) {
		return Base64.decodeToString(str);
	}
	
	/**
	 * MD5加密(不可逆的，所以没有解�?)
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str,String salt) {
		
		return new Md5Hash(str,salt).toString();
	}
	
	
	/**
	 * 测试加密解密
	 * @param args
	 */
	public static void main(String[] args) {
	String password = "123";
	System.out.println("Base64加密:"+encBase64(password));
	
	password=encBase64(password);
	System.out.println("Base64解密:"+decBase64(password));

	System.out.println("MD5加密:"+md5("123", "shirosimple"));
	
	}
}

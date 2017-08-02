package com.milosun.util;

import java.lang.reflect.Method;

import com.milosun.util.dao.StringUtils;

@SuppressWarnings("unchecked")
public class BeanValueUtils {
	private BeanValueUtils() {}
	public static <T> T getValue(Object obj,String attributeName,Class<T> cls) {
		
		try {
			Method getMethod=obj.getClass().getMethod("get"+ StringUtils.initcap(attributeName));
			return (T) getMethod.invoke(obj);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
}

package com.milosun.mysql.service.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import com.milosun.mysql.dbc.DatabaseConnection;

@SuppressWarnings("unchecked")
public class ServiceProxy implements InvocationHandler {
		
	private Object target; //需要有一个真实的操作类对象
	
	public <T> T bind(Class<T> cls) {
		try {//主要是是能让它返回一个指定类型
			this.target=cls.newInstance();
			return (T) Proxy.newProxyInstance(this.target.getClass().getClassLoader(), this.target.getClass().getInterfaces(), this);
		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	@Override
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		try {
			Object obj=null;
			String methodName=method.getName(); //取得业务层方法名称
			if(methodName.startsWith("add")  || 
			   methodName.startsWith("edit") || 
			   methodName.startsWith("remove")) {
				
				try {//此地方定义Exception，不能定义在外边，因为外边是控制关闭的Exception
					DatabaseConnection.getConnection().setAutoCommit(false);
					obj=method.invoke(this.target, args);
					//如果没有出现Exception,提交事务
					DatabaseConnection.getConnection().commit(); 
				} catch (Exception e) {
					//如果进入Exception，回滚事务
					DatabaseConnection.getConnection().rollback();
					//e.printStackTrace();
				}
			}else {
				obj=method.invoke(this.target, args);
			}
			return obj;
		} catch (Exception e) {
			throw e;
		}finally {//整个过程执行器完毕，需要关闭连接
			DatabaseConnection.close();
		}
	}

}

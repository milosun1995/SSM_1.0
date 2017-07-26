package org.ssm.dao;

import java.util.Set;

import org.ssm.entity.User;


public interface UserDao {

	/**
	 * 通过用户名查询用
	 * @param userName
	 * @return
	 */
	public User getByUserName(String userName);
	
	/**
	 * 通过用户名查询角色信
	 * @param userName
	 * @return
	 */
	public Set<String> getRoles(String userName);
	
	/**
	 * 通过用户名查询权限信
	 * @param userName
	 * @return
	 */
	public Set<String> getPermissions(String userName);
}
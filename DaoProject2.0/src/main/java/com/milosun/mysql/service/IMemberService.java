package com.milosun.mysql.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.milosun.mysql.vo.Member;

public interface IMemberService {
	/**
	 * 实现用户数据的追加操作处理，本操作要执行如下功能:<br>
	 * <li>1、使用IMemberDao.findById()方法判断要增加的用户信息是否存在。</li>
	 * <li>2、使用IMemberDao.doCreate()方法保存数据</li>
	 * <li>3、判断年龄是否大于0，如果不大于0，设置为-1</li>
	 * @param vo 要追加的VO对象
	 * @return 增加成功返回true,否则返回false
	 * @throws Exception (其实直接抛Exception并不标准，可根据具体出现什么情况抛什么异常，需要自定义一个异常类)
	 */
	public boolean add(Member vo) throws Exception;
	
	/**
	 * 进行用户数据的更新处理,此时需要执行如下处理:<br>
	 * <li>1、使用IMemberDao.doUpdate()方法进行修改</li>
	 * <li>2、判断年龄是否大于0，如果不大于0，设置为-1</li>
	 * @param vo 包含要更新的数据
	 * @return 更新成功返回true,否则返回false
	 * @throws Exception
	 */
	public boolean edit(Member vo) throws Exception;
	
	/**
	 * 进行用户的删除处理
	 * <li>1、判断集合之中是否有数据</li>
	 * <li>2、调用IMemberDao.doRemoveBatch()方法删除数据</li>
	 * @param ids 接受所要删除用户的id集合
	 * @return 如果集合为空,或者集合之中没有数据，以及删除失败都是false,否则返回true
	 * @throws Exception
	 */
	public boolean remove(Set<String> ids) throws Exception;
	
	/**
	 * 根据用户编号查询用户信息，调用IMemberDao.findById()方法执行操作
	 * @param id 要查询的用户编号
	 * @return 如果编号存在以VO对象返回,否则返回null
	 * @throws Exception
	 */
	public Member get(String id) throws Exception;
	
	/**
	 *  使用IMemberDao.findAll() 查询全部数据
	 * @return 所有数据以List集合集合返回,如果没有数据则集合长度为0
	 * @throws Exception
	 */
	public List<Member> list() throws Exception;
	
	/**
	 *  分页列表显示,要执行如下操作: <br>
	 *  <li>1、调用IMemberDao.findAllSplit()方法,取得全部的数据</li>
	 * @param currentPage 当前所在页
	 * @param lineSize 每页显示的数据量
	 * @return 本次的操作会返回多个结果,以Map的形式保存,包括如下内容:<br>
	 * <li>1、key= allMembers 、value= IMemberDao.findAllSplit(),类型: List&lt;Member&gt;</li>
	 * <li>2、key= memberCount、value= IMemberDao.getAllCount(), 类型: Long</li>
	 * @throws Exception
	 */
	public Map<String,Object> list(Integer currentPage,Integer lineSize) throws Exception;
	
	/**
	 *  分页列表显示,要执行如下操作: <br>
	 *  <li>1、调用IMemberDao.findAllSplit()方法,取得全部的数据</li>
	 *  <li>2、调用IMemberDao.getAllCount()方法,统计数据量</li>
	 * @param column 模糊查询数据列
	 * @param keyWord 模糊查询关键字
	 * @param currentPage 当前所在页
	 * @param lineSize 每页显示的数据量
	 * @return 本次的操作会返回多个结果,以Map的形式保存,包括如下内容:<br>
	 * <li>1、key= allMembers 、value= IMemberDao.findAllSplit(),类型: List&lt;Member&gt;</li>
	 * <li>2、key= memberCount、value= IMemberDao.getAllCount(), 类型: Long</li>
	 * @throws Exception
	 */
	public Map<String,Object> list(String column,String keyWord,Integer currentPage,Integer lineSize) throws Exception;
}

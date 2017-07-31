package com.milosun.mysql.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.milosun.mysql.dao.IMemberDao;
import com.milosun.mysql.dao.impl.MemberDaoImpl;
import com.milosun.mysql.dbc.DatabaseConnection;
import com.milosun.mysql.factory.DaoFactory;
import com.milosun.mysql.service.IMemberService;
import com.milosun.mysql.vo.Member;

public class MemberServiceImpl implements IMemberService {



	public boolean add(Member vo) throws Exception {
		try {
			// 1、取得IMeberDao接口对象
			IMemberDao dao = DaoFactory.getInstance(MemberDaoImpl.class);
			// 2、判断当前id是否存在
			if (null == dao.findById(vo.getMid())) {
				if (vo.getAge() <= 0) {// 年龄格式不符的,设置出错
					vo.setAge(-1); // 使用-1作为一个标志结果
				}
				// 4、进行数据库保存
				return dao.doCreate(vo);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseConnection.close();
		}
		return false;
	}

	public boolean edit(Member vo) throws Exception {
		try {
			// 1、取得IMeberDao接口对象
			IMemberDao dao = DaoFactory.getInstance(MemberDaoImpl.class);
			// 2、需要判断用户是否是自己
			Member temp = dao.findById(vo.getMid());
			if (temp != null) {
				return dao.doUpdate(vo);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseConnection.close();
		}

		return false;
	}

	public boolean remove(Set<String> ids) throws Exception {
		 try {
				if(ids==null || ids.size()==0) {
					return false;
				}
				return  DaoFactory.getInstance(MemberDaoImpl.class).doRemoveBatch(ids);
			} catch (Exception e) {
				throw e;
			}finally {
				DatabaseConnection.close();
			}
	}

	public Member get(String id) throws Exception {
		try {
            return  DaoFactory.getInstance(MemberDaoImpl.class).findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseConnection.close();
		}

	}

	public List<Member> list() throws Exception {
		try {
			return DaoFactory.getInstance(MemberDaoImpl.class).findAll();
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseConnection.close();
		}
	}

	public Map<String, Object> list(Integer currentPage, Integer lineSize) throws Exception {
		try {
			Map<String,Object> map=new HashMap<String, Object>(); 
			IMemberDao dao=	DaoFactory.getInstance(MemberDaoImpl.class);
			map.put("allMembers", dao.findAllSplit(currentPage, lineSize));
			map.put("memberCount", dao.getAllCount());
			return map;
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseConnection.close();
		}
	}

	public Map<String,Object> list(String column, String keyWord, Integer currentPage, Integer lineSize) throws Exception {
		try {
			Map<String,Object> map=new HashMap<String, Object>(); 
			IMemberDao dao=	DaoFactory.getInstance(MemberDaoImpl.class);
			if(column==null || keyWord == null || "".equals(keyWord)) {
				map.put("allMembers", dao.findAllSplit(currentPage, lineSize));
				map.put("memberCount", dao.getAllCount());
			}else {
				map.put("allMembers", dao.findAllSplit(column,keyWord,currentPage, lineSize));
				map.put("memberCount", dao.getAllCount());
			}
			return map;
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseConnection.close();
		}
	}

}

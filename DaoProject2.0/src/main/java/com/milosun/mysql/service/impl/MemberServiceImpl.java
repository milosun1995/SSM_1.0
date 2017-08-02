package com.milosun.mysql.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.milosun.mysql.dao.IMemberDao;
import com.milosun.mysql.dao.impl.MemberDaoImpl;
import com.milosun.mysql.factory.DaoFactory;
import com.milosun.mysql.service.IMemberService;
import com.milosun.mysql.vo.Member;

public class MemberServiceImpl implements IMemberService {

	public boolean add(Member vo) throws Exception {
			// 1、取得IMeberDao接口对象
			IMemberDao dao = DaoFactory.getInstance(MemberDaoImpl.class);
			return dao.doCreate(vo);

	}

	public boolean edit(Member vo) throws Exception {
			IMemberDao dao = DaoFactory.getInstance(MemberDaoImpl.class);
			return dao.doUpdate(vo);
	}

	public boolean remove(Set<String> ids) throws Exception {
				if(ids==null || ids.size()==0) {
					return false;
				}
				return  DaoFactory.getInstance(MemberDaoImpl.class).doRemoveBatch(ids);
	}

	public Member get(String id) throws Exception {
            return  DaoFactory.getInstance(MemberDaoImpl.class).findById(id);
	}

	public List<Member> list() throws Exception {
			return DaoFactory.getInstance(MemberDaoImpl.class).findAll();
	}

	public Map<String, Object> list(Integer currentPage, Integer lineSize) throws Exception {
			Map<String,Object> map=new HashMap<String, Object>(); 
			IMemberDao dao=	DaoFactory.getInstance(MemberDaoImpl.class);
			map.put("allMembers", dao.findAllSplit(currentPage, lineSize));
			map.put("memberCount", dao.getAllCount());
			return map;
	}

	public Map<String,Object> list(String column, String keyWord, Integer currentPage, Integer lineSize) throws Exception {
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
	}

}

package org.blog.milo.service.impl;

import javax.annotation.Resource;

import org.blog.milo.dao.BloggerDao;
import org.blog.milo.entity.Blogger;
import org.blog.milo.service.BloggerService;
import org.springframework.stereotype.Service;



/**
 * 博主Service实现类
 * @author Administrator
 *
 */
@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{

	@Resource
	private BloggerDao bloggerDao;

	public Blogger find() {
		return bloggerDao.find();
	}

	public Blogger getByUserName(String userName) {
		return bloggerDao.getByUserName(userName);
	}

	public Integer update(Blogger blogger) {
		return bloggerDao.update(blogger);
	}
	
	
}

package org.blog.milo.dao;

import org.blog.milo.entity.Blogger;

/**
 * ����Dao�ӿ�
 * @author java1234_С��
 *
 */
public interface BloggerDao {

	/**
	 * ��ѯ������Ϣ
	 * @return
	 */
	public Blogger find();
	
	/**
	 * ͨ���û�����ѯ�û�
	 * @param userName
	 * @return
	 */
	public Blogger getByUserName(String userName);
	
	/**
	 * ���²�����Ϣ
	 * @param blogger
	 * @return
	 */
	public Integer update(Blogger blogger);
}

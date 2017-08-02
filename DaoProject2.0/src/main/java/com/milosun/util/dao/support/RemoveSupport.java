package com.milosun.util.dao.support;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.milosun.util.Resource;

public class RemoveSupport {
	//定义序号以及列名称的关系
		private Map<Integer,Object> valueMap=new HashMap<Integer,Object>();
		
		/**
		 *  为删除语句之中的PreparedStatement对象设置内容
		 * @param type
		 * @param pstmt
		 * @throws SQLException 
		 */
		public void  setPreparedStatement(String type,PreparedStatement pstmt) throws SQLException {
			for (int x = 1; x <= valueMap.size(); x++) {
				if("String".equals(type)) {
					pstmt.setString(x, this.valueMap.get(x).toString());
				}else if("Integer".equals(type)){
					pstmt.setInt(x, Integer.valueOf(this.valueMap.get(x).toString())); 
				}
			}
		}
	/**
	 * 创建要删除的SQL语句
	 * @param type ID的数据类型
	 * @param ids 接收的ID集合
	 * @param cls VO类型
	 * @return
	 */
	public <T> String  createSQL(Set<?> ids,Class<T> cls) {
		StringBuffer buf=new StringBuffer();
		String tableName=cls.getSimpleName();
		String idColumn=Resource.getId(cls.getName());
		
		buf.append(" DELETE FROM ").append(tableName).append(" WHERE ").append(idColumn).append(" IN ( ");
		Iterator<?> iterator=ids.iterator();
		Integer seq=1;
		while(iterator.hasNext()) {
			buf.append("?,");
			valueMap.put(seq ++, iterator.next());
		}
		buf.delete(buf.length()-1, buf.length());
		buf.append(" ) ");
		return buf.toString();
	}
	
}

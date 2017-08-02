package com.milosun.util.dao.support;

import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;

import com.milosun.util.BeanValueUtils;
import com.milosun.util.Resource;
import com.milosun.util.dao.PreparedStatementUtils;

/**
 * 创建SQL的时候如果发现某些语句为null,那么不应该出现在更新语句之中;
 * @author MILO
 *
 */
public class UpdateSupport {
	private Object vo;
	//定义序号以及列名称的关系
	private Map<Integer,String> columnsMap=new HashMap<Integer,String>();
	public UpdateSupport(Object vo) {
		this.vo=vo;
	}
	public void setPreparedStatement(PreparedStatement pstmt) throws Exception{
		Integer i=0;
		for (int x = 1; x <=columnsMap.size(); x++) {
			PreparedStatementUtils.setPreparedStatement(x, pstmt,this.vo, this.columnsMap.get(x));
			i=x;
		}
		System.out.println(i);
	}
	
	public String createSQL() {
		Integer seq=1;
		StringBuffer buf=new StringBuffer();
		String idColumn=Resource.getId(this.vo.getClass().getName());
		String tableName=this.vo.getClass().getSimpleName();
		buf.append("UPDATE ").append(tableName).append(" SET ");
		Field voFields [] =this.vo.getClass().getDeclaredFields();
		for (int i = 0; i < voFields.length; i++) {
			if(!idColumn.equals(voFields[i].getName())){ //不是ID列的才能判断
				if(BeanValueUtils.getValue(this.vo, voFields[i].getName(),voFields[i].getType())!=null) {
					this.columnsMap.put(seq ++, voFields[i].getName());
					buf.append(voFields[i].getName()).append("=?,");
				}
			 }
		}	
		buf.delete(buf.length()-1, buf.length());
		buf.append(" WHERE ").append(idColumn).append("=?");
		this.columnsMap.put(seq ++, idColumn);
		return buf.toString();
	}
}

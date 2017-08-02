package com.milosun.util.dao.support;

import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;

import com.milosun.util.Resource;
import com.milosun.util.dao.PreparedStatementUtils;

/**
 * 此类主要完善增加操作的SQL语句创建、动态PreparedStatement内容设置、更新执行
 * @author MILO
 */
public class CreateSupport {
	private Object vo;
	//定义序号以及列名称的关系
	private Map<Integer,String> columnsMap=new HashMap<Integer,String>();
	public CreateSupport(Object vo) {
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
	/**
	 * 创建增加数据的SQL语句
	 * @param vo
	 * @return
	 */
	public String createSQL() {
		Integer seq=1;
		StringBuffer buf=new StringBuffer();
		StringBuffer bufHead=new StringBuffer();
		StringBuffer bufTail=new StringBuffer();
		String tableName=this.vo.getClass().getSimpleName(); //取得类名称,即对应数据库表名
		String idColumn=Resource.getId(vo.getClass().getName()); //获取对应表主键
		buf.append(" INSERT INTO ").append(tableName).append("(");
		bufHead.append(idColumn).append(","); //主键列名称
		bufTail.append("?").append(",");; //追加主键列的占位符 "?"
		this.columnsMap.put(seq ++, idColumn); //保存对应关系
		//随后需要取出所有的其他字段对应关系,但是这些对应关系里面不应该包含有主键列
		Field [] voFields = this.vo.getClass().getDeclaredFields();
		//一次将内容保存在集合里面,同时生成SQL语句
		for (int i = 0; i < voFields.length; i++) {
			if(!idColumn.equals(voFields[i].getName())) { //属性不是主键列
				bufHead.append(voFields[i].getName()).append(",");
				bufTail.append("?").append(",");
				this.columnsMap.put(seq ++, voFields[i].getName());
			}
		}
		//实现最后的SQL拼凑
		bufHead.delete(bufHead.length()-1, bufHead.length());
		bufTail.delete(bufTail.length()-1, bufTail.length());
		buf.append(bufHead).append(") VALUES (").append(bufTail).append(")");
		return buf.toString();
	}
}

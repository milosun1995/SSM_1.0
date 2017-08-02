package com.milosun.util.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Set;

import com.milosun.mysql.dbc.DatabaseConnection;
import com.milosun.util.dao.support.CreateSupport;
import com.milosun.util.dao.support.RemoveSupport;
import com.milosun.util.dao.support.UpdateSupport;

/**
 * 该类的主要功能是提供常规的数据层实现子类的操作方法支持
 * @author MILO
 */
public abstract class AbstractDao {
	protected  Connection conn;
    protected  PreparedStatement pstmt; // 所有的数据库操作都通过此接口完成
    public AbstractDao() {
	  this.conn=DatabaseConnection.getConnection();
	}
    /**
     * 实现数据的增加处理操作
     * @param 要进行增加数据处理的VO类对象
     * @return 增加成功返回true,否则返回false
     */
    public  boolean createSupport(Object vo) throws Exception {
    	CreateSupport support= new CreateSupport(vo);
    	this.pstmt=this.conn.prepareStatement(support.createSQL());
    	System.out.println(support.createSQL());
    	support.setPreparedStatement(pstmt);
    	return pstmt.executeUpdate()>0;
    } 
    
    /**
     * 实现数据的修改处理操作
     * @param vo 要修改的数据,此数据之中必须包含有主键ID
     * @return
     * @throws Exception
     */
    public  boolean updateSupport(Object vo) throws Exception{
    	UpdateSupport updateSupport=new UpdateSupport(vo);
    	this.pstmt=this.conn.prepareStatement(updateSupport.createSQL());
    	System.out.println(updateSupport.createSQL());
    	updateSupport.setPreparedStatement(pstmt);
    	return pstmt.executeUpdate()>0;
    	
    }
    
    public <T> boolean removeSupport(Set<?> ids,Class<T> cls) throws SQLException {
    	RemoveSupport removeSupport=new RemoveSupport();
    	String idType = ids.toArray()[0].getClass().getSimpleName(); 
    	this.pstmt = this.conn.prepareStatement(removeSupport.createSQL(ids, cls));
    	removeSupport.setPreparedStatement(idType,pstmt);
    	return this.pstmt.executeUpdate()==ids.size();
    }
}

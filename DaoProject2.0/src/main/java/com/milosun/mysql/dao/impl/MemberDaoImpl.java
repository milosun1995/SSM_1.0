package com.milosun.mysql.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.milosun.mysql.dao.IMemberDao;
import com.milosun.mysql.dbc.DatabaseConnection;
import com.milosun.mysql.vo.Member;

public class MemberDaoImpl implements IMemberDao {
	private Connection conn;
	private PreparedStatement pstmt;// 所有的数据库操作都通过此接口完成

	public MemberDaoImpl() {
		this.conn = DatabaseConnection.getConnection();
	}

	public boolean doCreate(Member vo) throws Exception {
		String sql = "INSERT INTO T_MEMBER(mid,name,age,phone,birthday,note) VALUES (?,?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getMid());
		this.pstmt.setString(2, vo.getName());
		this.pstmt.setInt(3, vo.getAge());
		this.pstmt.setString(4, vo.getPhone());
		this.pstmt.setDate(5, new java.sql.Date(vo.getBirthday().getTime()));
		this.pstmt.setString(6, vo.getNote());
		return this.pstmt.executeUpdate() > 0;
	}

	public boolean doUpdate(Member vo) throws Exception {
		String sql = "UPDATE T_MEMBER SET name=?,age=?,phone=?,birthday=?,note=? WHERE mid=?";
		this.pstmt = (PreparedStatement) this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getName());
		this.pstmt.setInt(2, vo.getAge());
		this.pstmt.setString(3, vo.getPhone());
		this.pstmt.setDate(4, new java.sql.Date(vo.getBirthday().getTime()));
		this.pstmt.setString(5, vo.getNote());
		this.pstmt.setString(6, vo.getMid());
		return this.pstmt.executeUpdate() > 0;
	}

	public boolean doRemoveBatch(Set<String> ids) throws Exception {
		StringBuffer buf = new StringBuffer(); // 需要频繁修改字符串
		buf.append("DELETE FROM T_MEMBER WHERE mid IN(");
		Iterator<String> iter = ids.iterator();
		while (iter.hasNext()) {
			buf.append("'").append(iter.next()).append("'").append(",");
		}
		buf.delete(buf.length() - 1, buf.length()).append(")");// 将结尾多出来的" , "删掉。
		this.pstmt = (PreparedStatement) this.conn.prepareStatement(buf.toString());
		return this.pstmt.executeUpdate() == ids.size();
	}

	public Member findById(String id) throws Exception {
		Member vo = null;
		String sql = "SELECT mid,name,age,phone,birthday,note FROM T_MEMBER WHERE mid=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) { // 如果有数据返回则进行对象实例化
			vo = new Member();
			vo.setMid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setAge(rs.getInt(3));
			vo.setPhone(rs.getString(4));
			vo.setBirthday(rs.getDate(5));
			vo.setNote(rs.getString(6));
		}
		return vo;
	}

	public List<Member> findAll() throws Exception {
		List<Member> all = new ArrayList<Member>();
		String sql = "SELECT mid,name,age,phone,birthday,note FROM T_MEMBER";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) { // 如果有数据返回则进行对象实例化
			Member vo = new Member();
			vo.setMid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setAge(rs.getInt(3));
			vo.setPhone(rs.getString(4));
			vo.setBirthday(rs.getDate(5));
			vo.setNote(rs.getString(6));
			all.add(vo);
		}
		return all;
	}

	public List<Member> findAllSplit(Integer currentPage, Integer lineSize) throws Exception {
		List<Member> all = new ArrayList<Member>();
		String sql = "SELECT mid,name,age,phone,birthday,note FROM T_MEMBER LIMIT ?,?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, currentPage * lineSize);
		this.pstmt.setInt(2, (currentPage - 1) * lineSize);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) { // 如果有数据返回则进行对象实例化
			Member vo = new Member();
			vo.setMid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setAge(rs.getInt(3));
			vo.setPhone(rs.getString(4));
			vo.setBirthday(rs.getDate(5));
			vo.setNote(rs.getString(6));
			all.add(vo);
		}
		return all;
	}

	public List<Member> findAllSplit(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception {
		List<Member> all = new ArrayList<Member>();
		String sql = "SELECT mid,name,age,phone,birthday,note FROM T_MEMBER WHERE " + column + " like ? LIMIT ?,?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setInt(2, currentPage * lineSize);
		this.pstmt.setInt(3, (currentPage - 1) * lineSize);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) { // 如果有数据返回则进行对象实例化
			Member vo = new Member();
			vo.setMid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setAge(rs.getInt(3));
			vo.setPhone(rs.getString(4));
			vo.setBirthday(rs.getDate(5));
			vo.setNote(rs.getString(6));
			all.add(vo);
		}
		return all;
	}

	public Long getAllCount() throws Exception {
		String sql = "SELECT COUNT(*) FROM T_MEMBER";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			return rs.getLong(1);
		}
		return 0L;
	}

	public Long getAllCount(String column, String keyWord) throws Exception {
		String sql = "SELECT COUNT(*) FROM T_MEMBER WHERE " + column + " like ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			return rs.getLong(1);
		}
		return 0L;
	}

}

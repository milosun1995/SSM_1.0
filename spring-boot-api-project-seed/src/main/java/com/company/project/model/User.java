package com.company.project.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "sys_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 登录名
     */
    private String account;

    /**
     * 密码(加密)
     */
    private String password;

    /**
     * 最后登录IP
     */
    @Column(name = "lastLoginIp")
    private String lastloginip;

    /**
     * 最后登录时间
     */
    @Column(name = "lastLoginTime")
    private Date lastlogintime;

    /**
     * 登录总次数
     */
    @Column(name = "loginCount")
    private Integer logincount;

    /**
     * 创建时间
     */
    @Column(name = "createTime")
    private Date createtime;

    /**
     * 是否启用
     */
    @Column(name = "isEnable")
    private Boolean isenable;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取登录名
     *
     * @return account - 登录名
     */
    public String getAccount() {
        return account;
    }

    /**
     * 设置登录名
     *
     * @param account 登录名
     */
    public void setAccount(String account) {
        this.account = account;
    }

    /**
     * 获取密码(加密)
     *
     * @return password - 密码(加密)
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码(加密)
     *
     * @param password 密码(加密)
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取最后登录IP
     *
     * @return lastLoginIp - 最后登录IP
     */
    public String getLastloginip() {
        return lastloginip;
    }

    /**
     * 设置最后登录IP
     *
     * @param lastloginip 最后登录IP
     */
    public void setLastloginip(String lastloginip) {
        this.lastloginip = lastloginip;
    }

    /**
     * 获取最后登录时间
     *
     * @return lastLoginTime - 最后登录时间
     */
    public Date getLastlogintime() {
        return lastlogintime;
    }

    /**
     * 设置最后登录时间
     *
     * @param lastlogintime 最后登录时间
     */
    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    /**
     * 获取登录总次数
     *
     * @return loginCount - 登录总次数
     */
    public Integer getLogincount() {
        return logincount;
    }

    /**
     * 设置登录总次数
     *
     * @param logincount 登录总次数
     */
    public void setLogincount(Integer logincount) {
        this.logincount = logincount;
    }

    /**
     * 获取创建时间
     *
     * @return createTime - 创建时间
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * 设置创建时间
     *
     * @param createtime 创建时间
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * 获取是否启用
     *
     * @return isEnable - 是否启用
     */
    public Boolean getIsenable() {
        return isenable;
    }

    /**
     * 设置是否启用
     *
     * @param isenable 是否启用
     */
    public void setIsenable(Boolean isenable) {
        this.isenable = isenable;
    }
}
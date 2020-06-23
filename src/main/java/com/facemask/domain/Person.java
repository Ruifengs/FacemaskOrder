package com.facemask.domain;

/**
 * 普通用户实体类
 */
public class Person {
    private int pId;              //用户ID
    private String username;      //登录用户名
    private String password;      //密码
    private String pName;         //真实姓名
    private String idNum;         //身份证号码
    private String phoneNum;      //电话号码
    private Integer permissions;  //用户权限  0-管理员  1-普通用户

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getIdNum() {
        return idNum;
    }

    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getPermissions() {
        return permissions;
    }

    public void setPermissions(Integer permissions) {
        this.permissions = permissions;
    }

    @Override
    public String toString() {
        return "Person{" +
                "pId=" + pId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", pName='" + pName + '\'' +
                ", idNum='" + idNum + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", permissions=" + permissions +
                '}';
    }
}

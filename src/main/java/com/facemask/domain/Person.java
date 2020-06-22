package com.facemask.domain;

/**
 * 普通用户实体类
 */
public class Person {
    private String pId;
    private String password;

    public Person(){

    }

    public Person(String pId, String password) {
        this.pId = pId;
        this.password = password;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Person{" +
                "pId=" + pId +
                ", password='" + password + '\'' +
                '}';
    }
}

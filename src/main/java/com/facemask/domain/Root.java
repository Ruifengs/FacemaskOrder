package com.facemask.domain;

/**
 * 管理员实体类
 * @author 许锐锋
 */
public class Root {
    private String rootId;
    private String password;

    public String getRootId() {
        return rootId;
    }

    public void setRootId(String rootId) {
        this.rootId = rootId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Root{" +
                "rootId='" + rootId + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

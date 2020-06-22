package com.facemask.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 *  预约订单实体类
 */
public class Orders {
    private String orderId;
    private String pName;
    private String pId;
    private String idNum;
    private long phoneNum;
    private Integer fmaskId;
    private Integer fmaskNum;
    private float fmaskPrice;
    private Date orderTime;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getIdNum() {
        return idNum;
    }

    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    public long getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(long phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getFmaskId() {
        return fmaskId;
    }

    public void setFmaskId(Integer fmaskId) {
        this.fmaskId = fmaskId;
    }

    public Integer getFmaskNum() {
        return fmaskNum;
    }

    public void setFmaskNum(Integer fmaskNum) {
        this.fmaskNum = fmaskNum;
    }

    public float getFmaskPrice() {
        return fmaskPrice;
    }

    public void setFmaskPrice(float fmaskPrice) {
        this.fmaskPrice = fmaskPrice;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date orderTime) {
        this.orderTime = orderTime;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderId='" + orderId + '\'' +
                ", pName='" + pName + '\'' +
                ", pId=" + pId +
                ", idNum='" + idNum + '\'' +
                ", phoneNum=" + phoneNum +
                ", fmaskId=" + fmaskId +
                ", fmaskNum=" + fmaskNum +
                ", fmaskPrice=" + fmaskPrice +
                ", orderTime=" + orderTime +
                '}';
    }
}

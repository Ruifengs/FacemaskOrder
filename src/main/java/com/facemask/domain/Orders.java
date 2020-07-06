package com.facemask.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * 预约订单实体类
 */
public class Orders {
    private Integer orderId;     //订单号
    private Integer pId;         //用户ID
    private Integer fmaskId;     //口罩ID
    private Integer fmaskNum;    //预约口罩数量
    private float fmaskPrice;    //口罩总价
    private Date orderTime;      //预约时间
    private Integer orderStatus; //口罩领用状态  1--已领取 0--未领取
    private Date getFacemaskTime; //口罩领用时间

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
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

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getGetFacemaskTime() {
        return getFacemaskTime;
    }

    public void setGetFacemaskTime(Date getFacemaskTime) {
        this.getFacemaskTime = getFacemaskTime;
    }


    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", pId=" + pId +
                ", fmaskId=" + fmaskId +
                ", fmaskNum=" + fmaskNum +
                ", fmaskPrice=" + fmaskPrice +
                ", orderTime=" + orderTime +
                ", orderStatus=" + orderStatus +
                '}';
    }
}

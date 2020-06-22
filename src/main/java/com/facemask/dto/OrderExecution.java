package com.facemask.dto;

import org.springframework.stereotype.Component;

/**
 * 将结果进行预约借口进行封装
 */
@Component
public class OrderExecution {

    //口罩ID
    private int f_id;
    //返回状态值
    private int state;
    //返回信息
    private String stateInfo;

    public OrderExecution(){

    }

    public OrderExecution(int f_id, int state, String stateInfo) {
        this.f_id = f_id;
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getF_id() {
        return f_id;
    }

    public void setF_id(int f_id) {
        this.f_id = f_id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    @Override
    public String toString() {
        return "OrderExecution{" +
                "f_id=" + f_id +
                ", state=" + state +
                ", stateInfo='" + stateInfo + '\'' +
                '}';
    }
}

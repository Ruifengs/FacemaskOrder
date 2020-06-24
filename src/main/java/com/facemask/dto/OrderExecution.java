package com.facemask.dto;

import com.facemask.enums.OrderStateEnum;
import org.springframework.stereotype.Component;

/**
 * 将结果进行预约借口进行封装
 */
@Component
public class OrderExecution {

    //口罩ID
    private String f_name;
    //返回状态值
    private int state;
    //返回信息
    private String stateInfo;

    public OrderExecution(){

    }

    public OrderExecution(String f_name, OrderStateEnum orderStateEnum) {
        this.f_name = f_name;
        this.state = orderStateEnum.getState();
        this.stateInfo = orderStateEnum.getStateInfo();
    }

    public String getF_name() {
        return f_name;
    }

    public void setF_name(String f_name) {
        this.f_name = f_name;
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
                "f_name='" + f_name + '\'' +
                ", state=" + state +
                ", stateInfo='" + stateInfo + '\'' +
                '}';
    }
}

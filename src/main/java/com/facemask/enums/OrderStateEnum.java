package com.facemask.enums;

/**
 * 用枚举类型定义预约的情况，返回到客户端的信息
 */
public enum  OrderStateEnum {
    /**
     * 各种预约情况的信息
     */
    SUCCESS(1, "预约成功"),
    NO_NUMBER(0, "库存不足"),
    REPEAT_APPOINT(-1, "重复预约"),
    INNER_ERROR(-2, "系统异常");

    private int state;
    private String stateInfo;

    private OrderStateEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public static OrderStateEnum stateOf(int index) {
        for (OrderStateEnum state : values()) {
            if (state.getState() == index) {
                return state;
            }
        }
        return null;
    }
}

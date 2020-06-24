package com.facemask.domain;

public class Facemask {
    private Integer f_ID;            //口罩ID
    private String f_name;           //口罩名称
    private Integer f_total;         //口罩总量
    private Integer f_inventory;     //口罩库存
    private Integer f_received;      //已领取口罩数量
    private float f_price;           //口罩单价
    private Integer f_status;        //口罩状态     0--下架    1--启用

    public Integer getF_ID() {
        return f_ID;
    }

    public void setF_ID(Integer f_ID) {
        this.f_ID = f_ID;
    }

    public String getF_name() {
        return f_name;
    }

    public void setF_name(String f_name) {
        this.f_name = f_name;
    }

    public Integer getF_total() {
        return f_total;
    }

    public void setF_total(Integer f_total) {
        this.f_total = f_total;
    }

    public Integer getF_inventory() {
        return f_inventory;
    }

    public void setF_inventory(Integer f_inventory) {
        this.f_inventory = f_inventory;
    }

    public Integer getF_received() {
        return f_received;
    }

    public void setF_received(Integer f_received) {
        this.f_received = f_received;
    }

    public float getF_price() {
        return f_price;
    }

    public void setF_price(float f_price) {
        this.f_price = f_price;
    }

    public Integer getF_status() {
        return f_status;
    }

    public void setF_status(Integer f_status) {
        this.f_status = f_status;
    }

    @Override
    public String toString() {
        return "Facemask{" +
                "f_ID=" + f_ID +
                ", f_name='" + f_name + '\'' +
                ", f_total=" + f_total +
                ", f_inventory=" + f_inventory +
                ", f_received=" + f_received +
                ", f_price=" + f_price +
                ", f_status=" + f_status +
                '}';
    }
}

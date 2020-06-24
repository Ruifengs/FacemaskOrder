package com.facemask.domain;

import com.facemask.enums.RecordEnum;

import java.util.Date;
import java.util.List;

public class Record {

    private Integer r_ID;         //入库记录ID
    private Integer f_ID;         //口罩ID
    private Integer p_ID;         //管理员ID
    private Integer f_num;        //口罩操作数量
    private Date r_time;          //入库时间
    private Integer r_type;       //操作类型
    private String f_Name;        //口罩名称
    private String pName;         //操作人

    public Integer getR_ID() {
        return r_ID;
    }

    public void setR_ID(Integer r_ID) {
        this.r_ID = r_ID;
    }

    public Integer getF_ID() {
        return f_ID;
    }

    public void setF_ID(Integer f_ID) {
        this.f_ID = f_ID;
    }

    public Integer getP_ID() {
        return p_ID;
    }

    public void setP_ID(Integer p_ID) {
        this.p_ID = p_ID;
    }

    public Integer getF_num() {
        return f_num;
    }

    public void setF_num(Integer f_num) {
        this.f_num = f_num;
    }

    public Date getR_time() {
        return r_time;
    }

    public void setR_time(Date r_time) {
        this.r_time = r_time;
    }

    public Integer getR_type() {
        return r_type;
    }

    public void setR_type(Integer r_type) {
        this.r_type = r_type;
    }

    public String getF_Name() {
        return f_Name;
    }

    public void setF_Name(String f_Name) {
        this.f_Name = f_Name;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    @Override
    public String toString() {
        return "Record{" +
                "r_ID=" + r_ID +
                ", f_ID=" + f_ID +
                ", p_ID=" + p_ID +
                ", f_num=" + f_num +
                ", r_time=" + r_time +
                ", r_type=" + r_type +
                ", f_Name='" + f_Name + '\'' +
                ", pName='" + pName + '\'' +
                '}';
    }
}

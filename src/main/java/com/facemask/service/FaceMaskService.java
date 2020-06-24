package com.facemask.service;

import com.facemask.domain.Facemask;
import com.facemask.domain.Record;

import java.util.List;

public interface FaceMaskService {
    //添加口罩信息
    public int save_f(Facemask f, Record r);
    //更新口罩信息
    public int update_f(Facemask f,Record r);
    //修改口罩状态
    public int delete_f(Integer id,Integer status,Record r);
    //查询所有口罩信息
    public List<Facemask> findAll();
    //根据ID查询口罩信息
    public Facemask findByID(Integer id);
    //查询口罩总库存
    public int findInventory();
    //查询上架口罩总库存
    public List<Facemask> findALL_UP();
    //预约成功时减库存
    int subtract_f(Integer f_ID);
    //根据口罩ID查看口罩名
    String findF_Name(Integer f_ID);
}

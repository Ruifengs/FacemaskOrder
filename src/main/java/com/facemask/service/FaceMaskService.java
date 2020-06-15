package com.facemask.service;

import com.facemask.domain.Facemask;
import java.util.List;

public interface FaceMaskService {
    //添加口罩信息
    public int save_f(Facemask f);
    //更新口罩信息
    public int update_f(Facemask f);
    //删除口罩信息
    public int delete_f(Integer id);
    //查询所有口罩信息
    public List<Facemask> findAll();
    //根据ID查询口罩信息
    public Facemask findByID(Integer id);
    //查询口罩总库存
    public int findInventory();
}

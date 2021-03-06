package com.facemask.service.impl;

import com.facemask.domain.Facemask;
import com.facemask.domain.Record;
import com.facemask.enums.RecordEnum;
import com.facemask.mapper.FacemaskMapper;
import com.facemask.mapper.RecordMapper;
import com.facemask.service.FaceMaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.Date;
import java.util.List;

@Service
public class FaceMaskServiceImpl implements FaceMaskService {

    @Autowired
    FacemaskMapper facemaskMapper;
    @Autowired
    RecordMapper recordMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int save_f(Facemask f, Record r) throws Exception {
        try {
            //判断是否已经存在该名称的口罩
            if (facemaskMapper.findByName(f.getF_name()) == null) {
                r.setF_num(f.getF_total());
                Date date = new Date();
                r.setR_time(date);
                //入库操作类型
                r.setR_type(RecordEnum.INSERT.ordinal());
                //口罩入库操作
                facemaskMapper.save_f(f);
                Facemask fa = facemaskMapper.findByName(f.getF_name());
                r.setF_ID(fa.getF_ID());
                //添加一条入库记录
                recordMapper.save_r(r);
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    @Transactional
    public int update_f(Facemask f, Record r) {
        if (r.getP_ID() == null) {
            return facemaskMapper.update_f(f);
        } else {
            r.setF_ID(f.getF_ID());
            Date date = new Date();
            r.setR_time(date);
            //更新口罩信息
            facemaskMapper.update_f(f);
            //添加一条入库记录
            if (recordMapper.save_r(r) == 1)
                return 1;
            else return 0;
        }
    }

    @Override
    @Transactional
    public int delete_f(Integer id, Integer status, Record r) {
        r.setF_ID(id);
        Date date = new Date();
        r.setR_time(date);
        //判断上架还是下架
        if (status == 1) {
            r.setR_type(RecordEnum.DELETE.ordinal());
            r.setF_num(-facemaskMapper.findInventoryByFid(id));
        } else {
            r.setR_type(RecordEnum.INSERT.ordinal());
            r.setF_num(facemaskMapper.findInventoryByFid(id));
        }
        //口罩状态取反
        Integer sta = (status ^ 1);
        //更新口罩状态
        facemaskMapper.update_f_status(sta, id);
        //添加一条口罩入库记录
        if (recordMapper.save_r(r) == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public List<Facemask> findAll() {
        return facemaskMapper.findAll();
    }

    @Override
    public Facemask findByID(Integer id) {
        return facemaskMapper.findByID(id);
    }

    @Override
    public int findInventory() {
        return facemaskMapper.findInventory();
    }

    @Override
    public List<Facemask> findALL_UP() {
        return facemaskMapper.findAllStatus();
    }

    @Override
    public int subtract_f(Integer f_ID) {
        return facemaskMapper.subtract_f(f_ID);
    }

    @Override
    public String findF_Name(Integer f_ID) {
        return facemaskMapper.findF_Name(f_ID);
    }
}

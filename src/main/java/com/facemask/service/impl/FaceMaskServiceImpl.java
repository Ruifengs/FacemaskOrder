package com.facemask.service.impl;

import com.facemask.domain.Facemask;
import com.facemask.mapper.FacemaskMapper;
import com.facemask.service.FaceMaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaceMaskServiceImpl implements FaceMaskService {

    @Autowired
    FacemaskMapper facemaskMapper;

    @Override
    public int save_f(Facemask f) {
        //判断是否已经存在该名称的口罩
        if (facemaskMapper.findByName(f.getF_name()) == null) {
            return facemaskMapper.save_f(f);
        }else
            return 0;
    }

    @Override
    public int update_f(Facemask f) {
        return facemaskMapper.update_f(f);
    }

    @Override
    public int delete_f(Integer id) {
        return facemaskMapper.delete_f(id);
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
}

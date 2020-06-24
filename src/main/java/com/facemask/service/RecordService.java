package com.facemask.service;

import com.facemask.domain.Record;

import java.util.List;

public interface RecordService {
    //添加入库记录
    int save_r(Record r);
    //查询所有记录
    List<Record> findAll(int page,int size);
    //查询所有记录数
    int findCount();
}

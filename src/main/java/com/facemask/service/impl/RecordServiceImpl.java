package com.facemask.service.impl;

import com.facemask.domain.Record;
import com.facemask.mapper.RecordMapper;
import com.facemask.service.RecordService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
    RecordMapper recordMapper;

    @Override
    public int save_r(Record r) {
        return recordMapper.save_r(r);
    }

    @Override
    public List<Record> findAll(int page, int size) {
        PageHelper.startPage(page,size);
        return recordMapper.findAll();
    }

    @Override
    public int findCount() {
        return recordMapper.findAllNum();
    }
}

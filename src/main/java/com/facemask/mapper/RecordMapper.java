package com.facemask.mapper;

import com.facemask.domain.Record;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecordMapper {
    //添加入库记录
    @Insert("insert into record(f_ID,p_ID,f_num,r_time,r_type) " +
            "values (#{f_ID},#{p_ID},#{f_num},#{r_time},#{r_type})")
    int save_r(Record r);
    //查询所有记录
    @Select("select r_ID,f_Name,pName,r_type,f_num,r_time from record r,person p,facemask f where r.f_ID=f.f_ID and r.p_ID=p.pId")
    List<Record> findAll();
    //查询所有记录数
    @Select("select count(*) from record")
    int findAllNum();
}

package com.facemask.mapper;

import com.facemask.domain.Root;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface RootMapper {

    //登录root管理员
    @Select("select * from root where rootId=#{rootId} and password=#{password}")
    Root quaryPerson(Root root);
}

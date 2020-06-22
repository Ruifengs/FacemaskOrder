package com.facemask.mapper;

import com.facemask.domain.Person;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 许锐锋
 */

@Repository
public interface PersonMapper {

    //预约人注册
    @Insert("insert into person values(#{pId},#{password});")
    int insert(Person person);

    //登录验证用户
    @Select("select * from person where pId=#{pId} and password=#{password}")
    Person quaryPerson(Person person);

    //返回所有用户
    @Select("select * from person")
    List<Person> findAllperson();
}

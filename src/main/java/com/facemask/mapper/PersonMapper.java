package com.facemask.mapper;

import com.facemask.domain.Person;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 许锐锋
 */

@Repository
public interface PersonMapper {

    //预约人注册
    @Insert("insert into person (username,password,pName,idNum,phoneNum,permissions) " +
            "values(#{username},#{password},#{pName},#{idNum},#{phoneNum},#{permissions});")
    int insert(Person person);

    //登录验证用户
    @Select("select * from person where username=#{username} and password=#{password}")
    Person quaryPerson(Person person);

    //根据ID查找用户
    @Select("select * from person where pId=#{id}")
    Person findByID(Integer id);

    //返回所有用户
    @Select("select * from person")
    List<Person> findAllperson();

    //更新用户信息
    @Update("update person set username=#{username},password=#{password},idNum=#{idNum},phoneNum=#{phoneNum} where pId=#{pId}")
    int updatePerson(Person person);

    //删除用户
    @Delete("delete from person where pId=#{pId}")
    int delectPerson(Integer pId);
}

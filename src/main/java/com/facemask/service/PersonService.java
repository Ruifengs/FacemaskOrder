package com.facemask.service;

import com.facemask.domain.Person;

import java.util.List;

public interface PersonService {
    //预约人注册
    public int insert(Person person);

    //验证登录用户
    public Person quaryPerson(Person person);

    //返回所有普通用户信息
    List<Person> findAllperson();

    //根据ID查找用户
    Person findByID(Integer id);

    //更新用户信息
    int updatePerson(Person person);

    //删除用户
    int delectPerson(Integer pId);
}

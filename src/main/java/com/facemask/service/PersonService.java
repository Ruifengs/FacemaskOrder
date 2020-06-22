package com.facemask.service;

import com.facemask.domain.Person;
import com.facemask.domain.Root;

import java.util.List;

public interface PersonService {
    //预约人注册
    public int insert(Person person);

    //验证登录用户
    public Person quaryPerson(Person person);

    //验证管理员信息
    public Root quaryRoot(Root root);

    //返回所有普通用户信息
    List<Person> findAllperson();
}
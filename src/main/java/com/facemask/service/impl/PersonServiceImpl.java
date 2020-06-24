package com.facemask.service.impl;

import com.facemask.domain.Person;
import com.facemask.mapper.PersonMapper;
import com.facemask.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    PersonMapper personMapper;

    @Override
    public int insert(Person person) {
        return personMapper.insert(person);
    }

    @Override
    public Person quaryPerson(Person person) {

        return personMapper.quaryPerson(person);
    }


    @Override
    public List<Person> findAllperson() {
        return personMapper.findAllperson();
    }

    @Override
    public Person findByID(Integer id) {
        return personMapper.findByID(id);
    }

    @Override
    public int updatePerson(Person person) {
        return personMapper.updatePerson(person);
    }

    @Override
    public int delectPerson(Integer pId) {
        return personMapper.delectPerson(pId);
    }
}

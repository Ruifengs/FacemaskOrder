package com.facemask.service.impl;

import com.facemask.domain.Person;
import com.facemask.domain.Root;
import com.facemask.mapper.PersonMapper;
import com.facemask.mapper.RootMapper;
import com.facemask.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    PersonMapper personMapper;
    @Autowired
    RootMapper rootMapper;

    @Override
    public int insert(Person person) {
        return personMapper.insert(person);
    }

    @Override
    public Person quaryPerson(Person person) {

        return personMapper.quaryPerson(person);
    }

    @Override
    public Root quaryRoot(Root root) {
        return rootMapper.quaryPerson(root);
    }

    @Override
    public List<Person> findAllperson() {
        return personMapper.findAllperson();
    }
}

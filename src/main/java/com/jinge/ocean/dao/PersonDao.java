package com.jinge.ocean.dao;

import com.jinge.ocean.entity.Person;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zheng 2018-9-29 17:11:29
 */
public interface PersonDao {
    void addPerson(Person person);

    void delPersonById(@Param("personId") String personId);

    void updatePerson(Person person);

    List<Person> getAllPerson(@Param("personName") String personName, @Param("shipName") String shipName);

    Person getPersonById(@Param("personId") String personId);

}

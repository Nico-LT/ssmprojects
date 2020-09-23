package com.ssm.dao;

import com.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ITravellerDao {

    @Select("select * from traveller where id=#{id}")
    public List<Traveller> findById(String id);
}

package com.ssm.dao;

import com.ssm.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IProductDao {

    //根据id查询产品
    @Select("select * from product where id=#{id}")
    public Product findById(String id);


    //要添加依赖不然报错
    //查全部产品
    //持久层
    @Select("select * from product")
    public List<Product> findAll() throws Exception;

    @Insert("insert into product" +
            "(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus)" +
            "values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice}," +
            "#{productDesc},#{productStatus})")
    void save(Product product);


}

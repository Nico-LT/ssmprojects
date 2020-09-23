package com.ssm.service;


import com.ssm.domain.Product;

import java.util.List;

public interface IProductservice  {



    public List<Product> findAll() throws Exception;


    void save(Product product);

}

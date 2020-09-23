package com.ssm.service.Impl;

import com.ssm.dao.IProductDao;
import com.ssm.domain.Product;
import com.ssm.service.IProductservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class ProductServiceImpl implements IProductservice {
    @Autowired
    private IProductDao productDao;//applicationContext文件中加bean

    @Override
    public List<Product> findAll() throws Exception {
        return productDao.findAll();
    }

    @Override
    public void save(Product product) {
        productDao.save(product);
    }




}

package com.ssm.service.Impl;

import com.github.pagehelper.PageHelper;
import com.ssm.dao.IOrdersDao;
import com.ssm.domain.Orders;
import com.ssm.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    private IOrdersDao ordersDao;


    @Override
    public List<Orders> findAll(int page, int size) {
        //参数pageNum是页码值，参数pagesezu每页条数
        PageHelper.startPage(page, size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(String ordersId) {

        return ordersDao.findById(ordersId);
    }
}

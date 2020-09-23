package com.ssm.service;

import com.ssm.domain.Orders;

import java.util.List;

public interface IOrdersService {
    public List<Orders> findAll(int page,int size);

    Orders findById(String ordersId);
}

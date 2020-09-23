package com.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.domain.Orders;
import com.ssm.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private IOrdersService ordersService;

    //查询全部订单--为分页
//    @RequestMapping("/findAll.do")
//    public ModelAndView findAll(){
//
//        ModelAndView modelAndView=new ModelAndView();
//        List<Orders> ordersList = ordersService.findAll();
//        modelAndView.addObject("ordersList",ordersList);
//        modelAndView.setViewName("orders-list");
//        return modelAndView;
//
//    }
    @RequestMapping("/findAll.do")
    @Secured("ROLE_ADMIN")

    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "4") Integer size) {
        ModelAndView mv=new ModelAndView();

        List<Orders> ordersList = ordersService.findAll(page,size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo = new PageInfo(ordersList);

        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("orders-page-list");




        return mv;
    }
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(value = "id" ,required =true) String ordersId){
        ModelAndView mv=new ModelAndView();
        Orders orders = ordersService.findById(ordersId);
       // List<Traveller> travellers=ordersService.findById(ordersId);
        mv.addObject("orders",orders);
        mv.setViewName("orders-show");
        return mv;
    }

}

package com.ssm.controller;


import com.ssm.domain.Product;
import com.ssm.service.IProductservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductservice productservice;
    @RequestMapping("/save.do")
    public String save(Product product){
       productservice.save(product);
        return "redirect:findAll.do";
    }


    //查询全部产品
    @RequestMapping("/findAll.do")
    @RolesAllowed("ADMIN")
    public ModelAndView findALl() throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Product> ps = productservice.findAll();
        mv.addObject("productList",ps);
        mv.setViewName("product-list1");
        return mv;
    }
}

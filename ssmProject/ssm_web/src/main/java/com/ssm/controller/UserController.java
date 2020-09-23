package com.ssm.controller;

import com.ssm.domain.Role;
import com.ssm.domain.UserInfo;
import com.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private IUserService userService;

    //给用户添加角色
    @RequestMapping("/addRoleToUser")
    public String addRoleToUser(@RequestParam("userId") String userId,@RequestParam("ids") String [] roleIds) {

        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }

    //查询用户以及用户可以添加的角色
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam("id") String userId) {
        ModelAndView mv = new ModelAndView();
        //根据用户id查询用户
        UserInfo userInfo = userService.findById(userId);
        //根据用户id查询可以添加角色
       List<Role> otherRoles= userService.findOtherRoles(userId);
        mv.addObject("user", userInfo);
        mv.addObject("roleList", otherRoles);
        mv.setViewName("user-role-add");

        return mv;
    }

    //查询指定id用户
    @RequestMapping("findById.do")
    public  ModelAndView findById(String id){
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo= userService.findById(id);
        mv.addObject("user", userInfo);
        mv.setViewName("user-show");
        return mv;
    }


    //用户添加

    @RequestMapping("save.do")
    @PreAuthorize("authentication.principal.username=='tom'")
    public  String  save(UserInfo userInfo){
        userService.save(userInfo);
        return "redirect:findAll.do";

    }


    @RequestMapping("findAll.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();

        List<UserInfo> list=userService.findAll();
        mv.addObject("userList",list);
        mv.setViewName("user-list");

        return mv;


    }
}

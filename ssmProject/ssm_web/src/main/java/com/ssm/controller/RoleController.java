package com.ssm.controller;

import com.ssm.domain.Permission;
import com.ssm.domain.Role;
import com.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    //给角色添加权限
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam("roleId") String roleId ,@RequestParam("ids") String []permissionIds){

        roleService.addPermissionToRole(roleId, permissionIds);
        return "redirect:findAll.do";

    }
    //g根据roleId查询role，并查询出可以添加的权限
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam("id") String roleId){
        ModelAndView mv = new ModelAndView();
        //根据roleId查询role
        Role role = roleService.findById(roleId);
        //根据roleId查询要添加的权限
        List<Permission> otherPermissions=  roleService.findOtherPermissions(roleId);

        mv.addObject("role", role);
        mv.addObject("permissionList", otherPermissions);
        mv.setViewName("role-permission-add");
        return mv;
    }




    @RequestMapping("/findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<Role> roles = roleService.findAll();

        mv.addObject("roleList", roles);
        mv.setViewName("role-list");

        return mv;
    }

    @RequestMapping("/save.do")
    public  String save(Role role){

        roleService.save(role);

        return "redirect:findAll.do";
    }
    @RequestMapping("/deleteRole.do")
    public String deleteRole(@RequestParam("id") String roleId) {
        roleService.deleteRoleById(roleId);
        return  "redirect:findAll.do";
    }
}

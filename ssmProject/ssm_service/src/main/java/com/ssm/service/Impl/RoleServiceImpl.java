package com.ssm.service.Impl;

import com.ssm.dao.IRoleDao;
import com.ssm.domain.Permission;
import com.ssm.domain.Role;
import com.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    @Override
    public List<Role> findAll() {

        return roleDao.findAll();
    }

    @Override
    public void save(Role role) {
         roleDao.save(role);
    }

    @Override
    public void deleteRoleById(String roleId) {

        roleDao.deleteFromUser_RoleByRoleById(roleId);
        roleDao.deleteFromRole_PermissionByRoleById(roleId);
        roleDao.deleteRoleById(roleId);
    }

    @Override
    public Role findById(String roleId) {
        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findOtherPermissions(String roleId) {
        return roleDao.findOtherPermissions(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] permissionIds) {
        for (String permissionId : permissionIds) {
            roleDao.addPermissionToRole(roleId, permissionId);
        }
    }
}

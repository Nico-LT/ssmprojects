package com.ssm.service;

import com.ssm.domain.Permission;
import com.ssm.domain.Role;

import java.util.List;

public interface IRoleService {

    public List<Role> findAll();

    void save(Role role);

    void deleteRoleById(String roleId);

    Role findById(String roleId);

    List<Permission> findOtherPermissions(String roleId);

    void addPermissionToRole(String roleId, String[] permissionIds);
}

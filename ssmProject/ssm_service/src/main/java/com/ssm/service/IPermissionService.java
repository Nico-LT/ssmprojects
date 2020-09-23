package com.ssm.service;

import com.ssm.domain.Permission;

import java.util.List;

public interface IPermissionService {
    List<Permission> findAll();

    void save(Permission permission);

    void deletePermission(String permissionId);
}

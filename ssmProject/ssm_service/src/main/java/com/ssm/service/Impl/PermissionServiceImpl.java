package com.ssm.service.Impl;

import com.ssm.dao.IPermissionDao;
import com.ssm.domain.Permission;
import com.ssm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class PermissionServiceImpl implements IPermissionService {


    @Autowired
    private IPermissionDao permissionDao;

    @Override
    public List<Permission> findAll() {
        return permissionDao.findAll();
    }

    @Override
    public void save(Permission permission) {
        permissionDao.save(permission);
    }

    @Override
    public void deletePermission(String permissionId) {
        permissionDao.deleteFromRole_Permission(permissionId);
        permissionDao.deleteById(permissionId);

    }
}

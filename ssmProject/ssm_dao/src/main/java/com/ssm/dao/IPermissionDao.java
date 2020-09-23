package com.ssm.dao;

import com.ssm.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IPermissionDao {
    @Select("select * from permission where id in(select permissionId from role_permission where roleId=#{id})")
    public List<Permission> findPermissionByRoleId(String id);

    @Select("select * from permission")
    List<Permission> findAll();

    @Insert("insert into permission(permissionName,url) values(#{permissionName},#{url})")
    void save(Permission permission);

    @Delete("delete from role_permission where permissionId=#{permissionId}")
    void deleteFromRole_Permission(String permissionId);

    @Delete("delete from permission where id=#{permissionId}")
    void deleteById(String permissionId);
}

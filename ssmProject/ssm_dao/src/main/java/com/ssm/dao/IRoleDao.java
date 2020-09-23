package com.ssm.dao;

import com.ssm.domain.Permission;
import com.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {


    //根据用户id查询所有对应的角色
    @Select("select * from role where id in(select roleId from users_role where userId=#{userId})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = List.class,many = @Many(select = "com.ssm.dao.IPermissionDao.findPermissionByRoleId")
            )



    })
    public List<Role> findByRoleByUserId(String userId);

    @Select("select * from role")
    List<Role> findAll();

    @Insert("insert into role (roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role);

    @Delete("delete from users_role where roleId=#{roleId}")
    void deleteFromUser_RoleByRoleById(String roleId);

    @Delete("delete from role_permission where roleId=#{roleId}")
    void deleteFromRole_PermissionByRoleById(String roleId);

    @Delete("delete from role where id=#{roleId}")
    void deleteRoleById(String roleId);

    @Select("select * from role where id=#{roleId}")
    Role findById(String roleId);

    @Select("select * from permission where id not " +
    "in(select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermissions(String roleId);

    @Insert("insert into role_permission(permissionId,roleId) values(#{permissionId},#{roleId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);
}

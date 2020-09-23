package com.ssm.service;

import com.ssm.domain.Role;
import com.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {

    List<UserInfo> findAll();

    void save(UserInfo userInfo);

    UserInfo findById(String id);


    List<Role> findOtherRoles(String userId);

    void addRoleToUser(String userId, String[] roleIds);
}

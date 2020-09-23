package com.ssm.service.Impl;


import com.ssm.dao.ISysLogDao;
import com.ssm.domain.SysLog;
import com.ssm.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {


    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public void save(SysLog sysLog) {

        sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll() {
        return sysLogDao.findAll();
    }
}



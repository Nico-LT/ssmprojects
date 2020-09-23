package com.ssm.controller;


import com.ssm.domain.SysLog;
import com.ssm.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    private Date visitTime;//开始时间
    private Class clazz;//访问的类
    private Method method;//访问的方法
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysLogService sysLogService;




    //前置通知 主要是获取开始时间，执行的类是哪一个方法
    @Before("execution(* com.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {

        visitTime=new Date();//当前时间就是开始访问的时间
        clazz=jp.getTarget().getClass();//具体要访问的类
       String methodName=jp.getSignature().getName();//获得访问的方法的名称

        Object[] args = jp.getArgs();//获取访问的方法的参数


        //获取具体执行的方法的method对象
        if (args==null||args.length==0){
            method = clazz.getMethod(methodName);//只能获取无参数的方法
        }else {


            Class[]classArgs=new Class[args.length];
            for (int i=0;i<args.length;i++){
               classArgs[i]=args[i].getClass();
            }
            clazz.getMethod(methodName,classArgs);
        }


    }
    //后置通知
    @After("execution(* com.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp){
        long time = new Date().getTime()-visitTime.getTime();//获取访问的时长

        String url="";
        //获取url
        if (clazz!=null&&method!=null&&clazz!=LogAop.class){
            //1.获取类上的requestmapping（“oser”）
            RequestMapping clazzAnnption= (RequestMapping) clazz.getAnnotation(RequestMapping.class);

            if (clazzAnnption != null) {
                String[] classvalue = clazzAnnption.value();
               //2.获取方法上的@RequestMapping（）

                RequestMapping methodannotation = method.getAnnotation(RequestMapping.class);

                if (methodannotation != null) {
                    String[] methodvalue = methodannotation.value();
                    url = classvalue[0] + methodvalue[0];
                    //获取IP地址
                    String ip=request.getRemoteAddr();

                    //获取当前操作用户
                    SecurityContext constant = SecurityContextHolder.getContext();//从上下文获取当前登录用户
                    User user = (User) constant.getAuthentication().getPrincipal();
                    String username = user.getUsername();

                    //将日志封装到syslog
                    SysLog sysLog = new SysLog();
                    sysLog.setExecutionTime(time);
                    sysLog.setIp(ip);
                    sysLog.setMethod("[类名]："+clazz.getName()+"[方法名];"+method.getName());
                    sysLog.setUrl(url);
                    sysLog.setUsername(username);
                    sysLog.setVisitTime(visitTime);
                    //调用Service完成操作
                    sysLogService.save(sysLog);
                }
            }
        }





    }
}

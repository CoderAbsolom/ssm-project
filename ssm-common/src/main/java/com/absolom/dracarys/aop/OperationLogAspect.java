package com.absolom.dracarys.aop;

import com.absolom.dracarys.annotation.SysLogAnnotation;
import com.absolom.dracarys.log.model.SysLog;
import com.absolom.dracarys.log.service.SysLogServiceImpl;
import com.absolom.dracarys.util.IPUtils;
import com.absolom.dracarys.util.ServiceUtil;
import com.alibaba.fastjson.JSONArray;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.*;

/**
 * @ClassName: OperationLogAspect.java
 * @Description: 使用aop实现系统操作日志
 * @author: zhepan@outlook.com
 * @date: 2017/12/4 20:59
 */
@Aspect
@Component
public class OperationLogAspect {

    /**
     * 本地异常日志记录对象
     */
    private static final Logger logger = LoggerFactory.getLogger(OperationLogAspect.class);

    private ThreadLocal<Long> startTime = new ThreadLocal<Long>();

    private ThreadLocal<SysLog> localLog = new ThreadLocal<SysLog>();

    //注入Service和Request对象
    @Resource
    private SysLogServiceImpl sysLogService;
    @Resource
    private HttpServletRequest request;

    /**
     * 定义日志切入点：注解类型/扫描类型
     */
    @Pointcut("@annotation(com.absolom.dracarys.annotation.SysLogAnnotation)")
    /*@Pointcut("execution(* com.kingboy.*.controller..*(..))")*/
    public void logPointCut(){
    }

    /**
     * 后置通知 用于拦截service层记录用户的操作
     * @param joinPoint 切点
     */
    @Before("logPointCut()")
    public void doBefore(JoinPoint joinPoint) {
        try {
            //记录请求开始时间
            startTime.set(System.currentTimeMillis());

            //数据库日志
            if(null == request){
                logger.debug("Request对象为空");
            }else{
                SysLog log = new SysLog();
                log.setAppName("");
                log.setUserID(null == request.getAttribute("currentUser") ? null : request.getAttribute("currentUser").toString());
                log.setLogType(0);
                log.setMethodName(getFullMethodName(joinPoint));
                log.setRequestMethod(request.getMethod());
                log.setParams(request.getParameterMap());
                log.setOperation(getMethodDescription(joinPoint));
                log.setRequestIp(IPUtils.getIpAddr(request));
                log.setRequestUri(request.getRequestURI());
                log.setUserAgent(request.getHeader("User-Agent"));
                log.setLogID(ServiceUtil.getidByUUID());
                log.setExceptionCode(null);
                log.setExceptionDetail(null);
                log.setCreateDate(new Date());
                localLog.set(log);
            }
        }  catch (Exception e) {
            //记录本地异常日志
            logger.error("==后置通知异常==");
            logger.error("异常信息:{}", e.getMessage());
        }
    }

    /**
     * 切入点return内容之后切入内容（可以用来对处理返回值做一些加工处理）
     * @param ret
     * @throws Throwable
     */
    @AfterReturning(returning = "ret", pointcut = "logPointCut()")
    public void doAfterReturning(Object ret) throws Throwable {
        // 处理完请求，返回内容
        SysLog log = localLog.get();
        log.setTimeConsuming(System.currentTimeMillis() - startTime.get());
        // 保存数据库
        sysLogService.insert(log,false);
    }

    /**
     * 异常通知 用于拦截service层记录异常日志
     *
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "logPointCut()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
        //请求的参数
        Object[] args = joinPoint.getArgs();
        try {
            // 保存数据库
            SysLog log = localLog.get();
            log.setLogType(1);
            log.setExceptionCode(e.getClass().getName());
            log.setExceptionDetail(e.getMessage());
            //保存数据库
            sysLogService.insert(log,false);
        }  catch (Exception ex) {
            //记录本地异常日志
            logger.error("异常方法,全路径:{},异常信息:{},请求参数:{}", getFullMethodName(joinPoint), e.getMessage(), JSONArray.toJSON(args));
        }
    }

    /**
     * 获取注解中对方法的描述信息
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    private static String getMethodDescription(JoinPoint joinPoint)
            throws Exception {
        String description = "";
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        SysLogAnnotation operationLog = method.getAnnotation(SysLogAnnotation.class);
        if(null != operationLog){
            description = operationLog.value();
        }
        return description;
    }

    /**
     * 获取请求的方法名全路径
     * @param joinPoint
     * @return
     */
    private static String getFullMethodName(JoinPoint joinPoint){
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //请求的方法名全路径
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        return className + "." + methodName + "()";
    }
}

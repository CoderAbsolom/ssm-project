package com.absolom.dracarys.annotation;

import java.lang.annotation.*;

/**
 * @ClassName: SysLogAnnotation.java
 * @Description: 注解：记录系统日志
 * @author: zhepan@outlook.com
 * @date: 2017/12/4 20:57
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLogAnnotation {

    String value() default "";
}

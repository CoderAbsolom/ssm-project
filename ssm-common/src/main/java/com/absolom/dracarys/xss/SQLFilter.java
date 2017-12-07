package com.absolom.dracarys.xss;

import com.absolom.dracarys.util.RRException;
import org.apache.commons.lang.StringUtils;

import java.util.Arrays;
import java.util.stream.Stream;

/**
 * @Title: SQLFilter
 * @Description: SQL过滤
 * @author: gs
 * @date: 2017/8/25 11:25
 */
public class SQLFilter {

    /**
     * SQL注入过滤
     * @param str  待验证的字符串
     */
    public static String sqlInject(String str){
        if(StringUtils.isBlank(str)){
            return null;
        }
        //去掉'|"|;|\字符
        //str = StringUtils.replace(str, "'", "");
        //str = StringUtils.replace(str, "\"", "");
        str = StringUtils.replace(str, ";", "");
        //str = StringUtils.replace(str, "\\", "");

        //转换成小写
        //str = str.toLowerCase();

        //非法字符
        String[] keywords = {"master", "truncate", "insert", "select", "delete", "update", "declare", "alert", "create", "drop"};

        //判断是否包含非法字符
        for(String keyword : keywords){
            if(str.contains(keyword)){
                throw new RRException("包含非法字符");
            }
        }

        return str;
    }
}

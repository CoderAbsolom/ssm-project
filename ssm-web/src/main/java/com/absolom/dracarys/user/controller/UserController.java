package com.absolom.dracarys.user.controller;

import com.absolom.dracarys.annotation.SysLogAnnotation;
import com.absolom.dracarys.base.controller.BaseController;
import com.absolom.dracarys.cache.MyBatisRedisCache;
import com.absolom.dracarys.user.model.SysUser;
import com.absolom.dracarys.user.service.ISysUserService;
import com.absolom.dracarys.util.Constants;
import com.absolom.dracarys.util.R;
import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @ClassName: UserController.java
 * @Description: 用户管理
 * @author: zhepan@outlook.com
 * @date: 2017/9/2 16:40
 */

@RestController
@RequestMapping("/user")
public class UserController extends BaseController<UserController> {

    @Resource
    private ISysUserService iSysUserService;

    @SysLogAnnotation("查询用户信息")
    @RequestMapping("/query")
    public R select(String userID) {
        return R.ok(iSysUserService.findByID(userID));
    }

    @SysLogAnnotation("获取用户列表")
    @RequestMapping("/list")
    public R list() {
        SysUser user = new SysUser();
        user.setEnabledFlag(Constants.ENABLED_CODE);
        return R.ok(iSysUserService.findListByWhere(user));
    }

    @SysLogAnnotation("修改用户信息")
    @RequestMapping("/update")
    public R update(String userID) {
        userID = "003094690b164d5c869de61298ce9ce3";
        SysUser user = new SysUser();
        user.setUserID(userID);
        user.setPassword("111");
        return R.ok(iSysUserService.update(user,true));
    }

    @SysLogAnnotation("放入缓存")
    @RequestMapping("/setCache")
    public R getCache(String key,String value) {

        return R.ok("================================缓存放入 key:" + key + " value:" + value);
    }

    @SysLogAnnotation("提取缓存")
    @RequestMapping("/getCache")
    public R getCache(String key) {
        return R.ok("================================缓存取出 key:" + key + " value:" );
    }


}

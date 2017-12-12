package com.absolom.dracarys.user.controller;

import com.absolom.dracarys.annotation.SysLogAnnotation;
import com.absolom.dracarys.base.controller.BaseController;
import com.absolom.dracarys.user.model.User;
import com.absolom.dracarys.util.Constants;
import com.absolom.dracarys.util.R;
import com.absolom.dracarys.user.service.IUserService;
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
    private IUserService iUserService;

    @SysLogAnnotation("查询用户信息")
    @RequestMapping("/query")
    public R select(String userID) {
        userID = "003094690b164d5c869de61298ce9ce3";
        return R.ok(iUserService.findByID(userID));
    }

    @SysLogAnnotation("获取用户列表")
    @RequestMapping("/list")
    public R list() {
        User user = new User();
        user.setEnabledFlag(Constants.ENABLED_CODE);
        return R.ok(iUserService.findListByWhere(user));
    }

    @SysLogAnnotation("修改用户信息")
    @RequestMapping("/update")
    public R update(String userID) {
        userID = "003094690b164d5c869de61298ce9ce3";
        User user = new User();
        user.setUserID(userID);
        user.setPassword("111");
        return R.ok(iUserService.update(user,true));
    }


}

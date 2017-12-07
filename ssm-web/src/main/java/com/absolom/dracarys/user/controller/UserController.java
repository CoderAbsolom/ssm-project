package com.absolom.dracarys.user.controller;

import com.absolom.dracarys.annotation.SysLogAnnotation;
import com.absolom.dracarys.base.controller.BaseController;
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
    public R select(String content,String userID) {
        content = "003094690b164d5c869de61298ce9ce3";
        return R.ok(iUserService.findByID(content));
    }


}

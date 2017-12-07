package com.absolom.dracarys.user.service.impl;

import com.absolom.dracarys.base.service.BaseServiceImpl;
import com.absolom.dracarys.user.dao.UserMapper;
import com.absolom.dracarys.user.model.User;
import com.absolom.dracarys.user.service.IUserService;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User,UserMapper> implements IUserService {


}

package com.absolom.dracarys.user.service.impl;

import com.absolom.dracarys.base.service.BaseServiceImpl;
import com.absolom.dracarys.user.dao.SysUserMapper;
import com.absolom.dracarys.user.model.SysUser;
import com.absolom.dracarys.user.service.ISysUserService;
import org.springframework.stereotype.Service;

@Service("userService")
public class SysUserServiceImpl extends BaseServiceImpl<SysUser,SysUserMapper> implements ISysUserService {


}

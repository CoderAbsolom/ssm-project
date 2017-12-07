package com.absolom.dracarys.log.service;

import com.absolom.dracarys.base.service.BaseServiceImpl;
import com.absolom.dracarys.log.dao.SysLogMapper;
import com.absolom.dracarys.log.model.SysLog;
import org.springframework.stereotype.Service;

/**
 * Created by PanZhe on 2017/12/4.
 */
@Service("sysLogService")
public class SysLogServiceImpl extends BaseServiceImpl<SysLog, SysLogMapper> {
}

package com.absolom.dracarys.dictionary.mapper;
import com.absolom.dracarys.base.dao.BaseDao;
import com.absolom.dracarys.dictionary.model.SysDictionary;
import com.absolom.dracarys.annotation.MyBatisDao;

import java.util.List;

/**
 * 字典配置
 * 
 * @author zhepan
 * @date 2017-12-15 16:39:01
 */
@MyBatisDao
public interface SysDictionaryMapper extends BaseDao<SysDictionary> {

    List<SysDictionary> queryChildDictionary();
	
}

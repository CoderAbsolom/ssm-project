package com.absolom.dracarys.dictionary.service.impl;
import com.absolom.dracarys.base.service.BaseServiceImpl;
import com.absolom.dracarys.cache.BaseRedisUtil;
import com.absolom.dracarys.cache.HashMapRedis;
import com.absolom.dracarys.dictionary.mapper.SysDictionaryMapper;
import com.absolom.dracarys.dictionary.model.SysDictionary;
import com.absolom.dracarys.dictionary.service.SysDictionaryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * @author zhepa
 */
@Transactional(readOnly = true,rollbackFor = Exception.class)
@Service("sysDictionaryService")
public class SysDictionaryServiceImpl extends BaseServiceImpl<SysDictionary,SysDictionaryMapper> implements SysDictionaryService {

    private SysDictionaryMapper sysDictionaryMapper;

    @Resource
    private void setSysDictionaryMapper(SysDictionaryMapper sysDictionaryMapper){
        this.sysDictionaryMapper = sysDictionaryMapper;
        List<SysDictionary> dictionaries = sysDictionaryMapper.queryChildDictionary();
        HashMapRedis redisUtil = new HashMapRedis();
        for (SysDictionary dictionary : dictionaries) {
            redisUtil.putObject("dictionary",dictionary.getCode(),dictionary.getValue());
        }
    }
	
}

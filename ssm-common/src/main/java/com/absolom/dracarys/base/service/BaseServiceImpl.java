package com.absolom.dracarys.base.service;

import com.absolom.dracarys.annotation.SysLogAnnotation;
import com.absolom.dracarys.base.dao.BaseDao;
import com.absolom.dracarys.base.model.BaseEntity;
import com.absolom.dracarys.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public abstract class BaseServiceImpl<T extends BaseEntity<T>,D extends BaseDao<T>>implements BaseService<T> {

    @Autowired
    protected D mapper;

    @Override
    public T findByID(Object id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<T> findListByWhere(T record) {
        return mapper.queryList(record);
    }

    @Override
    public Integer findCount(T record) {
        return mapper.queryTotal(record);
    }

    @Override
    public boolean insert(T record, boolean selectiveFlag) {
        record.setCreateDate(new Date());
        record.setUpdateDate(new Date());
        record.setEnabledFlag(Constants.ENABLED_CODE);
        return returnResult(selectiveFlag ? mapper.insertSelective(record) : mapper.insert(record));
    }

    @Override
    public boolean update(T record, boolean selectiveFlag) {
        record.setUpdateDate(new Date());
        record.setEnabledFlag(StringUtils.isEmpty(record.getEnabledFlag()) ? Constants.ENABLED_CODE : record.getEnabledFlag());
        return returnResult(selectiveFlag ? mapper.updateByPrimaryKeySelective(record) : mapper.updateByPrimaryKey(record));
    }

    @Override
    public boolean deleteByID(Object ID) {
        return returnResult(mapper.deleteByPrimaryKey(ID));
    }

    @Override
    public boolean deleteBatchByID(List<T> records) {
        return returnResult(mapper.deleteBatch(records));
    }

    /**
     * 判断sql返回值
     * @param count
     * @return
     */
    protected boolean returnResult(int count){
        return count != 0;
    }
}

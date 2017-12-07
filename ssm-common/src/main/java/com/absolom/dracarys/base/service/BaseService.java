package com.absolom.dracarys.base.service;

import com.absolom.dracarys.base.model.BaseEntity;

import java.util.List;

public interface BaseService<T extends BaseEntity<T>> {

    /**
     * 根据ID查询数据
     * @param ID
     * @return
     */
     T findByID(Object ID);

    /**
     * 条件查询数据List
     * @param record
     * @return
     */
     List<T> findListByWhere(T record);

    /**
     * 条件查询数据数量
     * @param record
     * @return
     */
     Integer findCount(T record);

    /**
     * 添加数据
     * @param record
     * @param selectiveFlag 是否忽略空字段
     * @return
     */
     boolean insert(T record, boolean selectiveFlag);

    /**
     * 修改数据
     * @param record
     * @param selectiveFlag 是否忽略空字段
     * @return
     */
     boolean update(T record, boolean selectiveFlag);

    /**
     * 根据ID删除
     * @param ID
     * @return
     */
     boolean deleteByID(Object ID);

    /**
     * 根据ID，批量删除
     * @param records
     * @return
     */
     boolean deleteBatchByID(List<T> records);

}

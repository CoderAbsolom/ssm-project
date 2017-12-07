package com.absolom.dracarys.base.dao;

import java.util.List;

/**
 * @ClassName: BaseDao.java
 * @Description: 基础DAO
 * @author: zhepan@outlook.com
 * @date: 2017/9/2 17:22
 */
public interface BaseDao<T> {

    /**
     * 根据主建删除
     * @param ID
     * @return
     */
    int deleteByPrimaryKey(Object ID);

    /**
     * 添加
     * @param record
     * @return
     */
    int insert(T record);

    /**
     * 添加  传空的不插入
     * @param record
     * @return
     */
    int insertSelective(T record);

    /**
     * 根据主键查询
     * @param ID
     * @return
     */
    T selectByPrimaryKey(Object ID);

    /**
     *修改 传空的不修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(T record);

    /**
     *修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(T record);

    /**
     * 批量删除
     * @param list
     * @return
     */
    int deleteBatch(List<T> list);

    /**
     *
     * @param record
     * @return 批量修改可用状态
     */
    int updateBatchFlag(T record);

    /**
     * 批量保存，返回保存的条数
     * @param list
     * @return
     */
    int insertList(List<T> list);
    /**
     * 条件查询
     * @param record
     * @return
     */
    List<T> queryList(T record);

    /**
     * 查询记录数
     * @param record
     * @return
     */
    int queryTotal(T record);
}

package com.absolom.dracarys.dictionary.model;


import com.absolom.dracarys.base.model.BaseEntity;

/**
 * 字典配置
 *
 * @author zhepan
 * @email zhepan@outlook.com
 * @date 2017-12-15 16:39:01
 */
public class SysDictionary extends BaseEntity<SysDictionary> {

    private static final long serialVersionUID = 1L;

    private String id;

    //父级ID,默认为0
    private String parentID;

    //字典编码
    private String code;

    //字典名称
    private String name;

    //字典类型
    private String type;

    //字典值
    private String value;

    //排序号
    private Integer sort;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    /**
     * 设置：父级ID,默认为0
     */
    public void setParentID(String parentID) {
        this.parentID = parentID;
    }

    /**
     * 获取：父级ID,默认为0
     */
    public String getParentID() {
        return parentID;
    }

    /**
     * 设置：字典编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取：字典编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置：字典名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：字典名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置：字典类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取：字典类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置：字典值
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * 获取：字典值
     */
    public String getValue() {
        return value;
    }

    /**
     * 设置：排序号
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 获取：排序号
     */
    public Integer getSort() {
        return sort;
    }
}

package com.absolom.dracarys.util;

import com.absolom.dracarys.xss.SQLFilter;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 查询参数
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-14 23:15
 */
public class Query extends LinkedHashMap<String, Object> {

	private static final long serialVersionUID = 1L;

    private int page;

    private int limit;

    public Query(Map<String, Object> params){
        this.putAll(params);

        //分页参数
        if(null != params.get("page") && null != params.get("rows")){
            this.page = Integer.parseInt(params.get("page").toString());
            this.limit = Integer.parseInt(params.get("rows").toString());
        }else{
            this.page = 1;
            this.limit = 10;
        }
        this.put("offset", (page - 1) * limit);
        this.put("page", page);
        this.put("limit", limit);

        //防止SQL注入（因为sidx、order是通过拼接SQL实现排序的，会有SQL注入风险）
        if(null!= params.get("sidx")){
            String sidx = params.get("sidx").toString();
            this.put("sidx", SQLFilter.sqlInject(sidx));

        }
        if (null!= params.get("order")){
            String order = params.get("order").toString();
            this.put("order", SQLFilter.sqlInject(order));
        }

    }


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}

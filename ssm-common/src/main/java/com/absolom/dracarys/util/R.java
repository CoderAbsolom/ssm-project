package com.absolom.dracarys.util;

import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: R.java
 * @Description: 返回基础类
 * @author: zhepan@outlook.com
 * @date: 2017/9/2 22:51
 */
public class R extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	
	public R() {
		put("code", Constants.SUCCESS_CODE);
	}
	
	public static R error() {
		return error(500, "未知异常，请联系管理员");
	}
	
	public static R error(String msg) {
		return error(500, msg);
	}
	
	public static R error(int code, String msg) {
		R r = new R();
		r.put("code", code);
		r.put("msg", msg);
		return r;
	}

	public static R ok(String msg) {
		R r = new R();
		r.put("msg", msg);
		return r;
	}

	public static R ok(Object msg) {
		R r = new R();
		r.put("rows", msg);
		return r;
	}

	public static R okList(Object msg) {
		R r = new R();
		List<Object> list = new ArrayList<Object>(1);
		list.add(msg);
		r.put("rows", list);
		return r;
	}

	public static R ok(Map<String, Object> map) {
		R r = new R();
		r.putAll(map);
		return r;
	}
	
	public static R ok() {
		return new R();
	}


//	public static R page(PageInfo pageInfo) {
//		R r = new R();
//		r.clear();
//		r.put(Constants.TOTALCOUNT, pageInfo.getTotal());
//		r.put(Constants.DATA, pageInfo.getList());
//		r.put("code", Constants.SUCCESS_CODE);
//		return  r;
//	}

	public static R page(long totalCount, Object data) {
		R r = new R();
		r.clear();
		r.put(Constants.TOTALCOUNT, totalCount);
		r.put(Constants.DATA, data);
		r.put("code", Constants.SUCCESS_CODE);
		return  r;
	}

	public R put(String key, Object value) {
		super.put(key, value);
		return this;
	}

	public static R ok(Boolean flag, String msg) {
		return flag ? R.ok() : (StringUtils.isEmpty(msg) ? R.error() : R.error(msg));
	}
}

package com.absolom.dracarys.util;

/**
 * @ClassName: Constants.java
 * @Description: 静态配置
 * @author: zhepan@outlook.com
 * @date: 2017/9/2 22:16
 */
public final class Constants {

	public static final String JSON_LIST = "jsonlist";
	public static final String JSON = "json";
	/** total键 存放总记录数，必须的 ,EasyUI根据这个参数，可以计算page和number的值，这个值不是users的长度 */
	public static final String TOTALCOUNT = "total";
	/** rows键 存放每页记录 list */
	public static final String DATA = "rows";
	
	public static final int PAGESIZE = 10;
	
	public static final String SUCCESS = "success";
	public static final String MESSAGE = "message";

	/**成功**/
	public static final String SUCCESS_CODE = "0";
	/**失败**/
	public static final String ERROR_CODE = "1";

	/**禁用**/
	public static final String DELETE_FLAG = "1";
	/**可用**/
	public static final String ENABLED_CODE = "0";

}

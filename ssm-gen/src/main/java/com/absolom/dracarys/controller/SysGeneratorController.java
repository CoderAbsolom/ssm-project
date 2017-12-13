package com.absolom.dracarys.controller;


import com.absolom.dracarys.annotation.SysLogAnnotation;
import com.absolom.dracarys.base.controller.BaseController;
import com.absolom.dracarys.service.SysGeneratorService;
import com.absolom.dracarys.util.Query;
import com.absolom.dracarys.util.R;
import com.alibaba.fastjson.JSON;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月19日 下午9:12:58
 */
@RestController
@RequestMapping("/sys/generator")
public class SysGeneratorController extends BaseController<SysGeneratorController>{


	@Autowired
	private SysGeneratorService sysGeneratorService;

	/**
	 * 列表
	 */
	@SysLogAnnotation("分页获取数据表")
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<Map<String, Object>> list = sysGeneratorService.queryList(query);
		int total = sysGeneratorService.queryTotal(query);
//		PageUtils pageUtil = new PageUtils(list, total, query.getLimit(), query.getPage());
		return R.page(total,list);
	}
	
	/**
	 * 生成代码
	 */
	@SysLogAnnotation("生成代码")
	@RequestMapping("/code")
	public void code() throws IOException{
		String[] tableNames = new String[1];
		//获取表名
		String tables = getRequest().getParameter("tables");
		String packAge = getRequest().getParameter("package");
//		String codeType = orgRequest.getParameter("codeType");
//		String pagePackage = orgRequest.getParameter("pagePackage");
		tableNames[0] = tables;
//		tableNames = JSON.parseArray(tables).toArray(tableNames);
		
		byte[] data = sysGeneratorService.generatorCode(tableNames,packAge);

		getResponse().reset();
		getResponse().setHeader("Content-Disposition", "attachment; filename=\"template.zip\"");
		getResponse().addHeader("Content-Length", "" + data.length);
		getResponse().setContentType("application/octet-stream; charset=UTF-8");
  
        IOUtils.write(data, getResponse().getOutputStream());
	}
}

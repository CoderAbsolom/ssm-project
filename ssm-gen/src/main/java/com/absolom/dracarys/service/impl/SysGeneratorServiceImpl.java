package com.absolom.dracarys.service.impl;

/**  
 * @Title: SysGeneratorServiceImpl
 * @Description: 
 * @author: gs  
 * @date: 2017/10/16 14:48
 */
import com.absolom.dracarys.mapper.SysGeneratorMapper;
import com.absolom.dracarys.service.SysGeneratorService;
import com.absolom.dracarys.utils.GenUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

@Transactional(readOnly = true,rollbackFor = Exception.class)
@Service("sysGeneratorService")
public class SysGeneratorServiceImpl implements SysGeneratorService {
	@Autowired
	private SysGeneratorMapper sysGeneratorMapper;

	@Override
	public List<Map<String, Object>> queryList(Map<String, Object> map) {
		return sysGeneratorMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return sysGeneratorMapper.queryTotal(map);
	}

	@Override
	public Map<String, String> queryTable(String tableName) {
		return sysGeneratorMapper.queryTable(tableName);
	}

	@Override
	public List<Map<String, String>> queryColumns(String tableName) {
		return sysGeneratorMapper.queryColumns(tableName);
	}

	@Override
	public byte[] generatorCode(String[] tableNames,String packAge) {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(outputStream);
		
		for(String tableName : tableNames){
			//查询表信息
			Map<String, String> table = queryTable(tableName);
			//查询列信息
			List<Map<String, String>> columns = queryColumns(tableName);
			//生成代码
			GenUtils.generatorCode(table, columns,packAge, zip);
		}
		IOUtils.closeQuietly(zip);
		return outputStream.toByteArray();
	}

}

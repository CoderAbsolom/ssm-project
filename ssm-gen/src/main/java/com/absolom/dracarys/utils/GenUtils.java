package com.absolom.dracarys.utils;

import com.absolom.dracarys.entity.ColumnEntity;
import com.absolom.dracarys.entity.TableEntity;
import com.absolom.dracarys.util.DateUtils;
import com.absolom.dracarys.util.IdGen;
import com.absolom.dracarys.util.RRException;
import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 代码生成器   工具类
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月19日 下午11:40:24
 */
public class GenUtils {

	private static List<String> getTemplates(){
		List<String> templates = new ArrayList<String>();
		templates.add("template/service/Entity.java.vm");
		templates.add("template/service/Dao.java.vm");
		templates.add("template/service/Dao.xml.vm");
		templates.add("template/service/Service.java.vm");
		templates.add("template/service/ServiceImpl.java.vm");
		templates.add("template/service/Controller.java.vm");
		templates.add("template/service/menu.sql.vm");
		return templates;
	}

	/**
	 * 生成代码
	 * @param table 表集合
	 * @param columns 列信息
	 * @param level 后端包
	 * @param zip 压缩流
	 */
	public static void generatorCode(Map<String, String> table,
			List<Map<String, String>> columns,String level, ZipOutputStream zip){
		//配置信息
		Configuration config = getConfig();
		
		//表信息
		TableEntity tableEntity = new TableEntity();
		tableEntity.setTableName(table.get("tableName"));
		tableEntity.setComments(table.get("tableComment"));
		//表名转换成Java类名
		String className = tableToJava(tableEntity.getTableName(), config.getString("tablePrefix"));
		tableEntity.setClassName(className);
		tableEntity.setClassname(StringUtils.uncapitalize(className));
		
		//列信息
		List<ColumnEntity> columsList = new ArrayList<>();
		for(Map<String, String> column : columns){
			ColumnEntity columnEntity = new ColumnEntity();
			columnEntity.setColumnName(column.get("columnName"));
			columnEntity.setDataType(column.get("dataType"));
			columnEntity.setComments(column.get("columnComment"));
			columnEntity.setExtra(column.get("extra"));
			
			//列名转换成Java属性名
			String attrName = columnToJava(columnEntity.getColumnName());
			columnEntity.setAttrName(attrName);
			columnEntity.setAttrname(StringUtils.uncapitalize(attrName));
			
			//列的数据类型，转换成Java类型
			String attrType = config.getString(columnEntity.getDataType(), "unknowType");
			columnEntity.setAttrType(attrType);
			
			//是否主键
			if("PRI".equalsIgnoreCase(column.get("columnKey")) && tableEntity.getPk() == null){
				tableEntity.setPk(columnEntity);
			}
			
			columsList.add(columnEntity);
		}
		tableEntity.setColumns(columsList);
		
		//没主键，则第一个字段为主键
		if(tableEntity.getPk() == null){
			tableEntity.setPk(tableEntity.getColumns().get(0));
		}
		
		//设置velocity资源加载器
		Properties prop = new Properties();  
		prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		prop.put("runtime.log.logsystem.class", "org.apache.velocity.runtime.log.SimpleLog4JLogSystem");
		prop.put("runtime.log.logsystem.log4j.category", "velocity");
		prop.put("runtime.log.logsystem.log4j.logger", "velocity");
		Velocity.init(prop);
//		level ="base";
		//封装模板数据
		Map<String, Object> map = new HashMap<>();
		map.put("tableName", tableEntity.getTableName());
		map.put("comments", tableEntity.getComments());
		map.put("pk", tableEntity.getPk());
		if (StringUtils.isNotEmpty(level)){
			map.put("level", level);
		}else{
			map.put("level", null);
		}
		map.put("className", tableEntity.getClassName());
		map.put("classname", tableEntity.getClassname());
		map.put("pathName", tableEntity.getClassname().toLowerCase());
		map.put("columns", tableEntity.getColumns());
		map.put("package", config.getString("package"));
		map.put("author", config.getString("author"));
		map.put("email", config.getString("email"));
//		map.put("pagePackage",pagePackage);
		map.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));
		map.put("keyid_1", IdGen.uuid());
		map.put("keyid_2", IdGen.uuid());
		map.put("keyid_3", IdGen.uuid());
		map.put("keyid_4", IdGen.uuid());
		map.put("keyid_5", IdGen.uuid());
		map.put("keyid_6", IdGen.uuid());

        VelocityContext context = new VelocityContext(map);
        
        //获取模板列表
		List<String> templates = getTemplates();
		for(String template : templates){
			//渲染模板
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, "UTF-8");
			tpl.merge(context, sw);
			
			try {
				//添加到zip
				zip.putNextEntry(new ZipEntry(getFileName(template, tableEntity.getClassName(), config.getString("package"),level)));
				IOUtils.write(sw.toString(), zip, "UTF-8");
				IOUtils.closeQuietly(sw);
				zip.closeEntry();
			} catch (IOException e) {
				throw new RRException("渲染模板失败，表名：" + tableEntity.getTableName(), e);
			}
		}
	}
	
	
	/**
	 * 列名转换成Java属性名
	 */
	public static String columnToJava(String columnName) {
		if ("ID".equals(columnName)){
			return "id";
		}
		if (columnName.indexOf("_")>0){
			return WordUtils.capitalizeFully(columnName, new char[]{'_'}).replace("_", "");
		}else {
			return columnName;
		}


	}
	
	/**
	 * 表名转换成Java类名
	 */
	public static String tableToJava(String tableName, String tablePrefix) {
		if(StringUtils.isNotBlank(tablePrefix)){
			tableName = tableName.replace(tablePrefix, "");
		}
		return columnToJava(tableName);
	}
	
	/**
	 * 获取配置信息
	 */
	public static Configuration getConfig(){
		try {
			return new PropertiesConfiguration("generator.properties");
		} catch (ConfigurationException e) {
			throw new RRException("获取配置文件失败，", e);
		}
	}
	
	/**
	 * 获取文件名
	 */
	public static String getFileName(String template, String className, String packageName,String levelPackageName){
		String packagePath = "main" + File.separator + "java" + File.separator;
		if(StringUtils.isNotBlank(packageName)){
			packagePath += packageName.replace(".", File.separator) + File.separator;
		}
		if (!StringUtils.isEmpty(levelPackageName)){
			packagePath += levelPackageName + File.separator;
		}
		if(template.contains("Entity.java.vm")){
			return packagePath + "model" + File.separator + className + ".java";
		}
		
		if(template.contains("Dao.java.vm")){
			return packagePath + "mapper" + File.separator + className + "Mapper.java";
		}
		
		if(template.contains("Dao.xml.vm")){
			return packagePath + "mapper" + File.separator + className + "Mapper.xml";
		}
		
		if(template.contains("Service.java.vm")){
			return packagePath + "service" + File.separator + className + "Service.java";
		}
		
		if(template.contains("ServiceImpl.java.vm")){
			return packagePath + "service" + File.separator + "impl" + File.separator + className + "ServiceImpl.java";
		}
		
		if(template.contains("Controller.java.vm")){
			return packagePath + "controller" + File.separator + className + "Controller.java";
		}
		String path ="main" + File.separator + "webapp" + File.separator + "jsp"
				+ File.separator;
		String jspath ="main" + File.separator + "webapp" + File.separator + "js"
				+ File.separator;
		if (!StringUtils.isEmpty(levelPackageName)||!StringUtils.isEmpty(packageName)){
			if(!StringUtils.isEmpty(levelPackageName)){
				path=path+levelPackageName+ File.separator;
				jspath=jspath+levelPackageName+ File.separator;
			}

		}
		if(template.contains("menu.sql.vm")){
			return className.toLowerCase() + "_menu.sql";
		}
		return null;
	}

}

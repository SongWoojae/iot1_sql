package com.iot1.sql.db.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;
import com.iot1.sql.db.service.DbService;

@Controller
public class DbController {

	@Autowired
	DbService ds;
	
	@RequestMapping(value="/db/list/tree",method=RequestMethod.POST)
	public @ResponseBody List<DbInfo> getGoodsInfoList(@RequestBody DbInfo di){
		return ds.getDbInfoList(di);
	}
	
	@RequestMapping(value="/db/connect",method=RequestMethod.POST)
	public @ResponseBody ModelMap getConnectDB(@RequestBody DbInfo di, ModelMap map){
		try{
			if(ds.isConnectDB(di)){
				map.put("databaseList", ds.getDateBaseList());
			}else{
				map.put("error", "데이터베이스에 접속하지 못했습니다.");
			}
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/db/table/list",method=RequestMethod.POST)
	public @ResponseBody ModelMap getTableList(@RequestBody DataBase db, ModelMap map){
		try{
			map.put("tableList", ds.getTableList(db));
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	
	@RequestMapping(value="/db/table/info",method=RequestMethod.POST)
	public @ResponseBody ModelMap getTableInfo(@RequestBody Table table, ModelMap map){
		try{
			map.put("tableList", ds.getTableInfo(table));
			map.put("key", "tableList");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	
	@RequestMapping(value="/db/run/sql",method=RequestMethod.POST)
	public @ResponseBody ModelMap getSqlResult(@RequestBody Map<String,String> pm, ModelMap map){
		try{
			map.put("resultMap", ds.runSql(pm));
			map.put("key", "resultMap");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/db/run/sqls", method=RequestMethod.POST)
	public @ResponseBody ModelMap getSqlResults(@RequestBody Map<String,List> pm, ModelMap map){
		try{
			map.put("resultMap", ds.runSqls(pm));
			map.put("key", "resultMap");
			map.put("state", "Success your SQL");
		}catch(Exception e){
			map.put("error", e.getMessage());
			map.put("state", "Fail your SQL");
		}
		return map;
	}

}

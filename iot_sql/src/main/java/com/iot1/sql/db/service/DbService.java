package com.iot1.sql.db.service;

import java.util.List;

import com.iot1.sql.db.dto.Column;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;

public interface DbService {
	public List<DbInfo> getDbInfoList(DbInfo di);
	public List<DataBase> getDateBaseList() throws Exception;
	public boolean isConnectDB(DbInfo pDi) throws Exception;
	public List<Table> getTableList(DataBase di) throws Exception;
	public List<Column> getTableInfo(Table table)throws Exception ;
	
}

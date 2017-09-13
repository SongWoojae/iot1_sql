package com.iot1.sql.db.dao;

import java.util.List;

import com.iot1.sql.db.dto.Column;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;

public interface DbDAO {
	public List<DbInfo> selectDbInfoList(DbInfo di);
	public DbInfo selectDbInfo(DbInfo di);
	public boolean isConnectDB(DbInfo di) throws Exception;
	public List<DataBase> selectDataBaseList() throws Exception;
	public List<Table> selectTableList(DataBase di) throws Exception;
	public List<Column> selectTableInfo(Table table) throws Exception ;
}

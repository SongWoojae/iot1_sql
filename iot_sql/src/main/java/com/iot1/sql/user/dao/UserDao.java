package com.iot1.sql.user.dao;

import java.util.List;
import java.util.Map;

import com.iot1.sql.user.dto.UserInfo;

public interface UserDao {
	public UserInfo selectUser(UserInfo user);
	
	public List<UserInfo> selectUserList(UserInfo hm);
	
	public 

}

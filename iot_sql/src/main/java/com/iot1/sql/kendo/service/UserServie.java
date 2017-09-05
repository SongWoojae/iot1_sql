package com.iot1.sql.kendo.service;

import java.util.List;

import com.iot1.sql.user.dto.UserInfo;

public interface UserServie {
	
	public UserInfo selectUser(UserInfo user);
	
	public List<UserInfo> selectUserList(UserInfo user);

}

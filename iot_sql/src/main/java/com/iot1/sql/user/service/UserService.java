package com.iot1.sql.user.service;


import java.util.Map;

import com.iot1.sql.user.dto.UserInfo;



public interface UserService {
	public UserInfo login(UserInfo user);
	
	public UserInfo selectUser(UserInfo user);
	
	public List<UserInfo> selectUserList
}

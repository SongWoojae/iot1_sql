package com.iot1.sql.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.user.dao.UserDAO;
import com.iot1.sql.user.dto.UserInfo;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO ud;
	
	@Override
	public UserInfo login(UserInfo user) {
		UserInfo rUser = ud.selectUser(user);
		if(rUser!=null && rUser.getUserPwd().equals(user.getUserPwd())){
			return rUser;
		}
		return null;
	}

	@Override
	public UserInfo selectUser(UserInfo user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserInfo> selectUserList(UserInfo user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertUser(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatetUser(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
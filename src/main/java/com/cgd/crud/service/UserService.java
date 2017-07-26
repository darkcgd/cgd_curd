package com.cgd.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgd.crud.bean.User;
import com.cgd.crud.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	/**
	 * 用户保存
	 * @param employee
	 */
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
	}

}

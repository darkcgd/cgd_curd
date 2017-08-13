package com.cgd.crud.service;

import com.cgd.crud.bean.User;
import com.cgd.crud.bean.UserExample;
import com.cgd.crud.dao.UserMapper;
import com.cgd.crud.util.BaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	/**
	 * 用户保存
	 * @param user
	 */
	public void saveUser(User user) {
		user.setUserType(1);
		user.setCreateTime(new Date());
		user.setUpdateTime(new Date());
		user.setLastLoginTime(new Date());
		userMapper.insert(user);
	}

	
	/**
	 去重复查询 
您可以在所有的Example类中调用 setDistinct(true) 方法进行强制去重复查询.

Criteria类 
Criteria 内部类的每个属性都包含 andXXX 方法，以及如下的标准的SQL查询方法:

IS NULL - 指相关的列必须为NULL 
IS NOT NULL - 指相关的列必须不为NULL 
= (equal) - 指相关的列必须等于方法参数中的值 
<> (not equal) - 指相关的列必须不等于方法参数中的值

(greater than) - 指相关的列必须大于方法参数中的值 
= (greater than or equal) - 指相关的列必须大于等于方法参数中的值 
< (less than) - 指相关的列必须小于于方法参数中的值 
<= (less than or equal) - 指相关的列必须小于等于方法参数中的值 
LIKE - 指相关的列必须 “like” 方法参数中的值. 这个方法不用必须加入 ‘%’, 您必须设置方法参数中的值. 
NOT LIKE - 指相关的列必须 “not like” 方法参数中的值. 这个方法不用必须加入 ‘%’, 您必须设置方法参数中的值. 
BETWEEN - 指相关的列必须在 “between” 方法参数中的两个值之间. 
NOT BETWEEN - 指相关的列必须不在 “not between” 方法参数中的两个值之间. 
IN - 指相关的列必须在传入的方法参数的list中. 
NOT IN - 指相关的列必须不在传入的方法参数的list中.
	 
	 */
	
	/**
	 * 根据用户name查询用户
	 * @param name
	 * @return
	 */
	public User getUserByName(String name) {
		UserExample userExample=new UserExample();  
        //通过Criteria构造查询条件  
        UserExample.Criteria criteria=userExample.createCriteria();  
        criteria.andUserNameEqualTo(name);
        //可能返回多条记录  
        List<User> list=userMapper.selectByExample(userExample);
        if(list.size()>0){
        	return list.get(0);
        }else{
        	return null;
        }
	}

	/***
	 * 根据用户id查询User
	 * @param userId
	 * @return
	 */
	public User getUserById(Integer userId) {
		if(BaseUtil.isNotEmpty(userId)){
			return userMapper.selectByPrimaryKey(userId);
		}
		return null;
	}

	/***
	 * 根据phone查询User
	 * @param phone
	 * @return
	 */
	public User isRegisted(String phone) {
		UserExample userExample=new UserExample();
		//通过Criteria构造查询条件
		UserExample.Criteria criteria=userExample.createCriteria();
		criteria.andPhoneEqualTo(phone);
		//可能返回多条记录
		List<User> list=userMapper.selectByExample(userExample);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 修改用户信息(头像,昵称,性别,年龄,手机号码,更新时间,最后登陆时间等)
	 */
	public int updateUserInfo(User user){
		/**
		 * 根据主键修改，空值条件不会修改成null
		 * 参数:1.要修改成的值
		 * 返回:成功修改个数
		 * updateByPrimaryKeySelective会对字段进行判断再更新(如果为Null就忽略更新)，如果你只想更新某一字段，可以用这个方法。

		 updateByPrimaryKey对你注入的字段全部更新
		 */
		user.setUpdateTime(new Date());
		return userMapper.updateByPrimaryKeySelective(user);
	}

	/**
	 * 修改密码
	 */
	public int updatePwd(Integer userId,String newPwd){
		User user=new User();
		user.setUserId(userId);
		user.setPwd(newPwd);
		UserExample userExample=new UserExample();
		//通过Criteria构造查询条件
		UserExample.Criteria criteria=userExample.createCriteria();
		criteria.andUserIdEqualTo(userId);
		return userMapper.updateByExampleSelective(user, userExample);
	}

	/**
	 * 发送验证码
	 */
	public void sendCode(){

	}

}

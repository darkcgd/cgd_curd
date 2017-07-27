package com.cgd.crud.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cgd.crud.bean.Employee;
import com.cgd.crud.bean.Msg;
import com.cgd.crud.bean.User;
import com.cgd.crud.service.EmployeeService;
import com.cgd.crud.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	/**
	 * 用户保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/regist",method=RequestMethod.GET)
	@ResponseBody
	public Msg saveUser(@Valid User user,BindingResult result){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			userService.saveUser(user);
			Msg success = Msg.success();
			return success;
		}
		
	}
}

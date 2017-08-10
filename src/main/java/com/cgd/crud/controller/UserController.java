package com.cgd.crud.controller;

import com.cgd.crud.bean.Msg;
import com.cgd.crud.bean.User;
import com.cgd.crud.service.TokenService;
import com.cgd.crud.service.UserService;
import com.cgd.crud.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	TokenService tokenService;
	
	/**
	 * 用户保存(注册)
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
			User userByName = userService.getUserByName(user.getName());
			if(userByName!=null){
					Msg msg = Msg.success("注册成功");
					Map<String, Object> data = msg.getData();
					data.put("user_id", userByName.getId());
					data.put("user_name", userByName.getName());
					data.put("user_token", userByName.getToken());
					data.put("user_phone", userByName.getPhone());
					data.put("user_sex", userByName.getSex());
					data.put("user_email", userByName.getEmail());
					System.out.println(userByName.getName()+"注册成功!");
					return msg;
			}else{
				return Msg.fail("注册失败");
			}
		}
	}
	
	/**
	 * 用户登录(账号密码)
	 * @param name
	 * @param pwd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Msg getUserByName(@RequestParam("name")String name,@RequestParam("pwd")String pwd,HttpServletRequest request){
		if(TokenUtil.isTokenStringValid(request.getParameter(TokenUtil.TOKEN_STRING_NAME), request.getSession())){  
		    //To Do 业务代码  
			System.out.println("isTokenStringValid");
		}  
		
		//先判断用户名是否是合法的表达式;
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!name.matches(regx)){
			return Msg.fail().add("msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		
		//数据库用户名重复校验
		User userByName = userService.getUserByName(name);
		if(userByName!=null){
			if(userByName.getPwd()!=null&&userByName.getPwd().equals(pwd)){
				tokenService.generateToken(userByName.getId());

				Msg msg = Msg.success("登录成功");
				Map<String, Object> data = msg.getData();
				data.put("user_id", userByName.getId());
				data.put("user_name", userByName.getName());
				data.put("user_token", userByName.getToken());
				data.put("user_phone", userByName.getPhone());
				data.put("user_sex", userByName.getSex());
				data.put("user_email", userByName.getEmail());
				return msg;
			}else{
				return Msg.fail("密码错误");
			}
		}else{
			return Msg.fail("用户不存在");
		}
	}
	
	
	
	
}

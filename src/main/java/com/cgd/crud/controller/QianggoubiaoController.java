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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cgd.crud.bean.Employee;
import com.cgd.crud.bean.Msg;
import com.cgd.crud.bean.Qianggoubiao;
import com.cgd.crud.bean.User;
import com.cgd.crud.service.EmployeeService;
import com.cgd.crud.service.QianggoubiaoService;
import com.cgd.crud.service.UserService;

@Controller
@RequestMapping("/qianggoubiao") 
public class QianggoubiaoController {

	@Autowired
	QianggoubiaoService service;
	
	/**
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.GET)
	@ResponseBody
	public Msg saveQianggoubiao(@Valid Qianggoubiao data,BindingResult result){
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
			if(data!=null){
				service.saveQianggoubiao(data);
				return Msg.success("保存成功");
			}
			return Msg.success("保存失败");
		}
	}
	
	/**
	 * 用户登录(账号密码)
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Msg getUserByName(@RequestParam("name")String name,@RequestParam("pwd")String pwd){
		//先判断用户名是否是合法的表达式;
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!name.matches(regx)){
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		
		/*User userByName = userService.getUserByName(name);
		if(userByName!=null){
			if(userByName.getPwd()!=null&&userByName.getPwd().equals(pwd)){
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
		}*/
		return Msg.fail("用户不存在");
	}
	
}

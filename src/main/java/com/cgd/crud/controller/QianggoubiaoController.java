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
	 * 参考 http://blog.csdn.net/whu_zcj/article/details/53506572
	 * 获取抢购表信息(重要)
	 * @param time 发布时间
	 * @param brand 品牌
	 * @param platform 平台
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getInfo")
	public Msg getInfo(@Valid Qianggoubiao qianggoubiao,BindingResult result){
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
			List<Qianggoubiao> info = service.getInfo(qianggoubiao);
			Msg msg = Msg.success("获取成功");
			Map<String, Object> data = msg.getData();
			data.put("list", info);
			return msg;
		}
		
	}
	
}

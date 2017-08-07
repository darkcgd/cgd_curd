package com.cgd.crud.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.Msg;
import com.cgd.crud.bean.Platform;
import com.cgd.crud.service.PlatformService;

@Controller
@RequestMapping("/platform") 
public class PlatformController extends BaseController{

	@Autowired
	PlatformService service;
	
	@RequestMapping(value="/getAllPlatformList",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAllPlatformList(@Valid Platform platform){
		List<Platform> info = service.getAllPlatFormList();
		Msg msg = Msg.success("获取成功");
		Map<String, Object> data = msg.getData();
		data.put("list", info);
		return msg;
	}
}

package com.cgd.crud.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cgd.crud.bean.Brand;
import com.cgd.crud.bean.Msg;
import com.cgd.crud.service.BrandService;

import base.BaseController;

@Controller
@RequestMapping("/brand") 
public class BrandController extends BaseController{

	@Autowired
	BrandService service;
	
	@RequestMapping(value="/getAllBrandList",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAllBrandList(@Valid Brand brand){
		List<Brand> info = service.getAllBrandList();
		Msg msg = Msg.success("获取成功");
		Map<String, Object> data = msg.getData();
		data.put("list", info);
		return msg;
	}
}

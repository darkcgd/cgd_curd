package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.bean.ProductTagBean;
import com.cgd.crud.service.ProductService;
import com.cgd.crud.service.ProductTagService;
import com.cgd.crud.util.Constant;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class ProductTagController extends BaseController{
	@Autowired
	ProductTagService productTagService;

	@ResponseBody
	@RequestMapping(value="/getAllProductTagList",method=RequestMethod.GET)
	public MsgBean getAllProductTagList(){
		List<ProductTagBean> info = productTagService.getAllProductTagList();
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		data.put("list", info);
		return msg;
	}
}

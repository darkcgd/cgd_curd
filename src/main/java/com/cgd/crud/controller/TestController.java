package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.service.ProductService;
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
public class TestController extends BaseController{

	@Autowired
	ProductService productService;

	@ResponseBody
	@RequestMapping(value="test/getProductList",method=RequestMethod.GET)
	public MsgBean getProductList(@RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								  @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		PageHelper.startPage(pagerNumber, pagerSize);
		List<ProductBean> info = productService.getProductList(0);
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		handlerPageInfo(data,new PageInfo(info, pagerSize));
		data.put("list", info);
		return msg;
	}



}

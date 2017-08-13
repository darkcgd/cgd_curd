package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.ProductCategoryBean;
import com.cgd.crud.bean.ProductTagBean;
import com.cgd.crud.service.ProductCategoryService;
import com.cgd.crud.service.ProductTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class ProductCategoryController extends BaseController{
	@Autowired
	ProductCategoryService productCategoryService;

	@ResponseBody
	@RequestMapping(value="/getAllProductCategoryList",method=RequestMethod.GET)
	public MsgBean getAllProductCategoryList(){
		List<ProductCategoryBean> info = productCategoryService.getAllProductCategoryList();
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		data.put("list", info);
		return msg;
	}
}

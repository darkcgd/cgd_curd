package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.Brand;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.MsgSimple;
import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.service.BrandService;
import com.cgd.crud.service.CollectService;
import com.cgd.crud.service.ProductService;
import com.cgd.crud.util.BaseUtil;
import com.cgd.crud.util.Constant;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController extends BaseController{

	@Autowired
	ProductService productService;
	@Autowired
	CollectService collectService;

	@ResponseBody
	@RequestMapping(value="/getProductList",method=RequestMethod.GET)
	public MsgBean getProductList(@RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								  @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		PageHelper.startPage(pagerNumber, pagerSize);
		List<ProductBean> info = productService.getProductList();
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		handlerPageInfo(data,new PageInfo(info, pagerSize));
		data.put("list", info);
		return msg;
	}

	/**
	 *
	 * @param collectType //1代表收藏商品,2代表收藏(关注)商家
	 * @param targetId   //目标id 如果collectType=1 即是商品id ....
	 * @param userId   //用户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="admin/doCollect",method= RequestMethod.GET)
	public Object doCollect(@RequestParam(value = "collectType", required=false) Integer collectType,
							 @RequestParam(value = "targetId", required=false) Integer targetId,
							 @RequestParam(value = "userId", required=false) Integer userId){

		if(BaseUtil.isEmpty(collectType)){
			return MsgSimple.fail("需要传collectType参数");
		}
		if(BaseUtil.isEmpty(targetId)){
			return MsgSimple.fail("需要传targetId参数");
		}
		MsgBean msg;
		int flag = collectService.doCollect(collectType,targetId, userId);//1代表收藏 0代表未收藏(取消收藏)

		if(flag==1){
			msg = MsgBean.success("收藏成功");
			Map<String, Object> data = msg.getData();
			data.put("isCollect",1);
		}else{
			msg = MsgBean.success("取消收藏成功");
			Map<String, Object> data = msg.getData();
			data.put("isCollect",0);
		}
		return msg;
	}



}

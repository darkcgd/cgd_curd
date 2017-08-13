package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.MsgSimple;
import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.bean.ShopBean;
import com.cgd.crud.service.CommonService;
import com.cgd.crud.service.ProductService;
import com.cgd.crud.service.ShopService;
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

import java.util.List;
import java.util.Map;

@Controller
public class ShopController extends BaseController{

	@Autowired
	ShopService shopService;
	@Autowired
	CommonService commonService;

	@ResponseBody
	@RequestMapping(value="/getShopList",method=RequestMethod.GET)
	public MsgBean getShopList(@RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								  @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		PageHelper.startPage(pagerNumber, pagerSize);
		List<ShopBean> info = shopService.getShopList();
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		handlerPageInfo(data,new PageInfo(info, pagerSize));
		data.put("list", info);
		return msg;
	}

	@ResponseBody
	@RequestMapping(value="/getShopDetail",method=RequestMethod.GET)
	public Object getShopDetail(@RequestParam(value = "shopId", required=false) Integer shopId){
		if(BaseUtil.isEmpty(shopId)){
			return MsgSimple.fail("需要传shopId参数");
		}
		ShopBean shopDetail = shopService.getShopDetail(shopId);
		if(shopDetail!=null){
			long collectCount = commonService.getCollectCount(2, shopId);
			long praiseCount = commonService.getPraiseCount(2, shopId);

			MsgBean msg = MsgBean.success("获取成功");
			Map<String, Object> data = msg.getData();
			data.put("shopId", shopDetail.getShopId());
			data.put("shopName", shopDetail.getShopName());
			data.put("logo", shopDetail.getLogo());
			data.put("phone", shopDetail.getPhone());
			data.put("fixedTelePhone", shopDetail.getFixedTelephone());
			data.put("grade", shopDetail.getGrade());
			data.put("country", shopDetail.getCountry());
			data.put("province", shopDetail.getProvince());
			data.put("city", shopDetail.getCity());
			data.put("county", shopDetail.getCounty());
			data.put("town", shopDetail.getTown());
			data.put("village", shopDetail.getVillage());
			data.put("address", shopDetail.getAddress());
			data.put("longitude", shopDetail.getLongitude());
			data.put("latitude", shopDetail.getLatitude());
			data.put("summary", shopDetail.getSummary());
			data.put("collectCount", collectCount);
			data.put("praiseCount", praiseCount);
			return msg;
		}else{
			return MsgBean.fail("查询不到该商家!");
		}
	}



}

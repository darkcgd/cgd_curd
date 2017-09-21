package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.*;
import com.cgd.crud.service.CommonService;
import com.cgd.crud.service.ProductService;
import com.cgd.crud.service.ShopService;
import com.cgd.crud.service.TokenService;
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

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class ShopController extends BaseController{

	@Autowired
	ShopService shopService;
	@Autowired
	CommonService commonService;
	@Autowired
	TokenService tokenService;

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


	@ResponseBody
	@RequestMapping("/shop/login")
	public Object shopLogin(@RequestParam(value = "name", required=false)String name, @RequestParam(value = "pwd", required=false)String pwd){
		if(BaseUtil.isEmpty(name)){
			return MsgSimple.fail("需要传name参数");
		}
		//先判断用户名是否是合法的表达式;
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!name.matches(regx)){
			return MsgSimple.fail("用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		if(BaseUtil.isEmpty(pwd)){
			return MsgSimple.fail("需要传pwd参数");
		}

		//数据库用户名重复校验
		ShopBean shopBean = shopService.getShopByName(name);
		if(shopBean!=null){
			if(shopBean.getPwd()!=null&&shopBean.getPwd().equals(pwd)){
				String token = tokenService.generateToken(shopBean.getShopId(),1);

				shopBean.setLastLoginTime(new Date());
				shopService.updateShopInfo(shopBean);//更新最后登录时间

				MsgBean msg = MsgBean.success("登录成功");
				Map<String, Object> data = msg.getData();
				data.put("shopId", shopBean.getShopId());
				data.put("shopName", shopBean.getShopName());
				data.put("token", token);
				data.put("phone", shopBean.getPhone());
				data.put("headUrl", shopBean.getHeadUrl());
				data.put("logo", shopBean.getLogo());
				data.put("grade", shopBean.getGrade());
				data.put("userType", 1);
				return msg;
			}else{
				return MsgBean.fail("密码错误");
			}
		}else{
			return MsgBean.fail("用户不存在");
		}
	}



}

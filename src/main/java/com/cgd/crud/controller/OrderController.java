package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.MsgSimple;
import com.cgd.crud.bean.OrderBean;
import com.cgd.crud.service.OrderService;
import com.cgd.crud.util.BaseUtil;
import com.cgd.crud.util.Constant;
import com.cgd.crud.util.OrderNumberGenerator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

@Controller
public class OrderController extends BaseController{

	@Autowired
	OrderService orderService;

	@ResponseBody
	@RequestMapping(value="order/getOrderList",method=RequestMethod.GET)
	public MsgBean getOrdertList(@RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								 @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		PageHelper.startPage(pagerNumber, pagerSize);
		List<OrderBean> info = orderService.getOrderList();
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		handlerPageInfo(data,new PageInfo(info, pagerSize));
		data.put("list", info);
		return msg;
	}

	@ResponseBody
	@RequestMapping(value="order/createOrder",method=RequestMethod.GET)
	public Object getOrdertList(@Valid OrderBean orderBean, BindingResult result){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return MsgBean.fail().add("errorFields", map);
		}else {
			Integer productId = orderBean.getProductId();
			//1待付款2待发货3发货中4待评价5已完成6已取消7已删除
			Integer userId = orderBean.getUserId();//全局拦截器已拦截处理
			Integer shopId = orderBean.getShopId();
			Integer productCount = orderBean.getProductCount();
			Long productPrice = orderBean.getProductPrice();
			Long logisticsPrice = orderBean.getLogisticsPrice();
			Long discountPrice = orderBean.getDiscountPrice();
			String reciverName = orderBean.getReciverName();
			String reciverPhone = orderBean.getReciverPhone();
			String reciverAddr = orderBean.getReciverAddr();

			if (BaseUtil.isEmpty(productId)) {
				return MsgSimple.fail("需要传productId参数");
			}
			if (BaseUtil.isEmpty(shopId)) {
				return MsgSimple.fail("需要传shopId参数");
			}
			if (BaseUtil.isEmpty(productCount)) {
				return MsgSimple.fail("需要传productCount参数");
			}
			if (productPrice == null || productPrice < 0) {
				return MsgSimple.fail("需要传productPrice参数");
			}
			if (logisticsPrice == null || logisticsPrice < 0) {
				return MsgSimple.fail("需要传logisticsPrice参数");
			}
			if (discountPrice == null || discountPrice < 0) {
				return MsgSimple.fail("需要传discountPrice参数");
			}
			if (BaseUtil.isEmpty(reciverName)) {
				return MsgSimple.fail("需要传reciverName参数");
			}
			if (BaseUtil.isEmpty(reciverPhone)) {
				return MsgSimple.fail("需要传reciverPhone参数");
			}
			if (BaseUtil.isEmpty(reciverAddr)) {
				return MsgSimple.fail("需要传reciverAddr参数");
			}

			orderBean.setOrderStatus(1);
			orderBean.setCreateTime(new Date());
			orderBean.setUpdateTime(new Date());

			String orderSn = "";
			CallThread callThread = new CallThread();
			callThread.start();
			try {
				callThread.join();    //保障前面2个线程在主进程之前结束，否则获取的结果可能为空或不完整
				orderSn = callThread.getOrderNum();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			if (BaseUtil.isEmpty(orderSn)) {
				return MsgSimple.fail("生成订单号异常");
			} else {
				orderBean.setOrderSn(orderSn);
				orderService.createOrder(orderBean);
				return MsgSimple.success("创建订单成功");
			}
		}
	}


	class CallThread extends Thread{
		private String orderNum;
		public CallThread(){
		}
		public void run() {
			try {
				OrderNumberGenerator makeOrder = new OrderNumberGenerator();
				 orderNum = makeOrder.makeOrderNum();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public String getOrderNum(){
			return this.orderNum;
		}
	}

}

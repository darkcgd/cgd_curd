package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.MsgSimple;
import com.cgd.crud.bean.OrderBean;
import com.cgd.crud.bean.User;
import com.cgd.crud.service.OrderService;
import com.cgd.crud.util.AbDateUtil;
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
import java.math.BigDecimal;
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
	public MsgBean getOrdertList(@RequestParam(value = "userId") Integer userId,
								 @RequestParam(value = "orderStatus", required=false) Integer orderStatus,
								 @RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								 @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		return getProductListMethod(userId,orderStatus,pagerNumber,pagerSize,1);
	}

	@ResponseBody
	@RequestMapping(value="order/getAdminOrderList",method=RequestMethod.GET)
	public MsgBean getAdminOrdertList(@RequestParam(value = "userId") Integer userId,
								 @RequestParam(value = "orderStatus", required=false) Integer orderStatus,
								 @RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								 @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){

		return getProductListMethod(userId,orderStatus,pagerNumber,pagerSize,0);
	}

	/**
	 *
	 * @param userId
	 * @param orderStatus
	 * @param pagerNumber
	 * @param pagerSize
	 * @param type 0代表admin 1代表是普通用户 用于区分是否返回 订单的数据
	 * @return
	 */
	private MsgBean getProductListMethod(Integer userId,Integer orderStatus,Integer pagerNumber,Integer pagerSize,int type){
		PageHelper.startPage(pagerNumber, pagerSize);
		////1待付款2待发货3发货中4待评价5已完成6已取消7已删除
		List<OrderBean> info = orderService.getOrderListWithOtherInfo(userId,orderStatus,type);
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		if(type==0){
			handlerPageInfoAdmin(data,new PageInfo(info, pagerSize));
		}else{
			handlerPageInfo(data,new PageInfo(info, pagerSize));
		}

		List<Map<String,Object>> orderBeanResults=new ArrayList<>();
		for (OrderBean orderBean:info) {
			Map<String,Object> map = new HashMap<>();
			map.put("orderId", orderBean.getOrderId());
			map.put("orderSn", orderBean.getOrderSn());
			map.put("productId", orderBean.getProductId());
			map.put("orderStatus", orderBean.getOrderStatus());
			map.put("userId", orderBean.getUserId());
			map.put("shopId", orderBean.getShopId());
			map.put("productCount", orderBean.getProductCount());
			map.put("productPrice", orderBean.getProductPrice());
			map.put("payMethod", orderBean.getPayMethod());
			map.put("paySn", orderBean.getPaySn());
			if(orderBean.getIsReturn()==null||orderBean.getIsReturn()==0){
				map.put("isReturn", 0);
			}else{
				map.put("isReturn", 1);
			}
			map.put("payMoney", orderBean.getPayMoney());
			if(orderBean.getLogisticsPrice()==null||orderBean.getLogisticsPrice().doubleValue()==0){
				map.put("logisticsPrice", 0);
			}else{
				map.put("logisticsPrice", orderBean.getLogisticsPrice().doubleValue());
			}
			map.put("discountPrice", orderBean.getDiscountPrice());
			map.put("reciverName", orderBean.getReciverName());
			map.put("reciverPhone", orderBean.getReciverPhone());
			map.put("reciverAddr", orderBean.getReciverAddr());
			map.put("senderId", orderBean.getSenderId());
			map.put("logisticsSn", orderBean.getLogisticsSn());
			map.put("remark", orderBean.getRemark());

			User user = orderBean.getUser();
			if(user==null){
				map.put("userName",null);
				map.put("userHeadUrl",null);
			}else{
				map.put("userName",user.getUserName());
				map.put("userHeadUrl",user.getHeadUrl());
			}

			handlerDateToStr(map,"createTime",orderBean.getCreateTime(),AbDateUtil.dateFormatYMDHMS);
			handlerDateToStr(map,"payTime",orderBean.getPayTime(),AbDateUtil.dateFormatYMDHMS);
			handlerDateToStr(map,"confirmTime",orderBean.getConfirmTime(),AbDateUtil.dateFormatYMDHMS);
			handlerDateToStr(map,"cancelTime",orderBean.getCancelTime(),AbDateUtil.dateFormatYMDHMS);
			handlerDateToStr(map,"sendTime",orderBean.getSendTime(),AbDateUtil.dateFormatYMDHMS);
			handlerDateToStr(map,"updateTime",orderBean.getUpdateTime(),AbDateUtil.dateFormatYMDHMS);
			orderBeanResults.add(map);
		}
		data.put("list", orderBeanResults);
		return msg;
	}


	@ResponseBody
	@RequestMapping(value="order/createOrder",method=RequestMethod.GET)
	public Object createOrder(@Valid OrderBean orderBean, BindingResult result){
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
			BigDecimal productPrice = orderBean.getProductPrice();
			BigDecimal logisticsPrice = orderBean.getLogisticsPrice();
			BigDecimal discountPrice = orderBean.getDiscountPrice();
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
			if (productPrice == null) {
				return MsgSimple.fail("需要传productPrice参数");
			}
			if (logisticsPrice == null) {
				return MsgSimple.fail("需要传logisticsPrice参数");
			}
			if (discountPrice == null) {
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
				MsgBean msg = MsgBean.success("创建订单成功");
				Map<String, Object> data = msg.getData();
				data.put("orderId", orderBean.getOrderId());
				data.put("orderSn", orderBean.getOrderSn());
				return msg;
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

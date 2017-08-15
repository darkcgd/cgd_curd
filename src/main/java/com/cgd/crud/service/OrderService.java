package com.cgd.crud.service;

import com.cgd.crud.bean.OrderBean;
import com.cgd.crud.dao.OrderBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
	
	@Autowired
	OrderBeanMapper orderBeanMapper;

	/**
	 * 保存订单信息
	 * @param orderBean
	 */
	public void createOrder(OrderBean orderBean) {
		orderBeanMapper.insert(orderBean);
	}

	/**
	 * 获取订单列表数据
	 * @return
	 */
	public List<OrderBean> getOrderList() {
		return orderBeanMapper.selectByExample(null);
	}

}

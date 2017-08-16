package com.cgd.crud.service;

import com.cgd.crud.bean.OrderBean;
import com.cgd.crud.bean.OrderBeanExample;
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


	/**
	 * 根据商品id查询订单的数量(即商品的销量===>多少笔交易)
	 * @param productId
	 * @return
	 */
	public long getOrderCount(Integer productId){
		long count=0;
		OrderBeanExample example=new OrderBeanExample();
		//通过Criteria构造查询条件
		OrderBeanExample.Criteria criteria=example.createCriteria();
		criteria.andProductIdEqualTo(productId);
		count = orderBeanMapper.countByExample(example);
		if(count<0){
			count=0;
		}
		return count;
	}

}

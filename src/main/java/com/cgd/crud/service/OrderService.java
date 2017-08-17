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
	 * @param userId
	 * @param orderStatus //1待付款2待发货3发货中4待评价5已完成6已取消7已删除
	 */
	public List<OrderBean> getOrderList(Integer userId, Integer orderStatus) {
		OrderBeanExample example=new OrderBeanExample();
		OrderBeanExample.Criteria criteria=example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		if(orderStatus!=null&&orderStatus>0){
			criteria.andUserIdEqualTo(orderStatus);
		}
		return orderBeanMapper.selectByExample(example);
	}

	/***
	 *
	 * @param userId
	 * @param orderStatus //1待付款2待发货3发货中4待评价5已完成6已取消7已删除
	 * @return
	 */
	public List<OrderBean> getOrderListWithOtherInfo(Integer userId,Integer orderStatus) {
		/*OrderBeanExample example=new OrderBeanExample();
		OrderBeanExample.Criteria criteria=example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		if(orderStatus!=null&&orderStatus>0){
			criteria.andUserIdEqualTo(orderStatus);
		}
		return orderBeanMapper.selectByExampleOtherInfo(example);*/
		return orderBeanMapper.selectByExampleOtherInfo(userId,orderStatus);
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

package com.cgd.crud.dao;

import com.cgd.crud.bean.OrderBean;
import com.cgd.crud.bean.OrderBeanExample;
import java.util.List;

import com.cgd.crud.bean.OrderStatusCount;
import org.apache.ibatis.annotations.Param;

public interface OrderBeanMapper {
    long countByExample(OrderBeanExample example);

    int deleteByExample(OrderBeanExample example);

    int deleteByPrimaryKey(Integer orderId);

    int insert(OrderBean record);

    int insertSelective(OrderBean record);

    List<OrderBean> selectByExample(OrderBeanExample example);

    OrderBean selectByPrimaryKey(Integer orderId);

    int updateByExampleSelective(@Param("record") OrderBean record, @Param("example") OrderBeanExample example);

    int updateByExample(@Param("record") OrderBean record, @Param("example") OrderBeanExample example);

    int updateByPrimaryKeySelective(OrderBean record);

    int updateByPrimaryKey(OrderBean record);

    List<OrderBean> selectByExampleShopOtherInfo(@Param("shopId") Integer shopId, @Param("orderStatus") Integer orderStatus);

    List<OrderBean> selectByExampleOtherInfo(@Param("shopId") Integer shopId, @Param("orderStatus") Integer orderStatus);

    OrderStatusCount selectOrderStatusCount(@Param("shopId") Integer shopId);
}
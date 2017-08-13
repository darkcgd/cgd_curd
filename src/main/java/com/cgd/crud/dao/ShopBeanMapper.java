package com.cgd.crud.dao;

import com.cgd.crud.bean.ShopBean;
import com.cgd.crud.bean.ShopBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShopBeanMapper {
    long countByExample(ShopBeanExample example);

    int deleteByExample(ShopBeanExample example);

    int deleteByPrimaryKey(Integer shopId);

    int insert(ShopBean record);

    int insertSelective(ShopBean record);

    List<ShopBean> selectByExample(ShopBeanExample example);

    ShopBean selectByPrimaryKey(Integer shopId);

    int updateByExampleSelective(@Param("record") ShopBean record, @Param("example") ShopBeanExample example);

    int updateByExample(@Param("record") ShopBean record, @Param("example") ShopBeanExample example);

    int updateByPrimaryKeySelective(ShopBean record);

    int updateByPrimaryKey(ShopBean record);
}
package com.cgd.crud.dao;

import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.bean.ProductBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductBeanMapper {
    long countByExample(ProductBeanExample example);

    int deleteByExample(ProductBeanExample example);

    int deleteByPrimaryKey(Integer productId);

    int insert(ProductBean record);

    int insertSelective(ProductBean record);

    List<ProductBean> selectByExampleWithBLOBs(ProductBeanExample example);

    List<ProductBean> selectByExample(ProductBeanExample example);

    ProductBean selectByPrimaryKey(Integer productId);

    int updateByExampleSelective(@Param("record") ProductBean record, @Param("example") ProductBeanExample example);

    int updateByExampleWithBLOBs(@Param("record") ProductBean record, @Param("example") ProductBeanExample example);

    int updateByExample(@Param("record") ProductBean record, @Param("example") ProductBeanExample example);

    int updateByPrimaryKeySelective(ProductBean record);

    int updateByPrimaryKeyWithBLOBs(ProductBean record);

    int updateByPrimaryKey(ProductBean record);

    void updateCountByPrimaryKey(Integer productId);

    void updateCountTo0ByPrimaryKey(Integer productId);

    List<ProductBean> selectProductListBySql(@Param("userId") Integer userId);
}
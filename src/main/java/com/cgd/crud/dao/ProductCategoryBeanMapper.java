package com.cgd.crud.dao;

import com.cgd.crud.bean.ProductCategoryBean;
import com.cgd.crud.bean.ProductCategoryBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductCategoryBeanMapper {
    long countByExample(ProductCategoryBeanExample example);

    int deleteByExample(ProductCategoryBeanExample example);

    int deleteByPrimaryKey(Integer categoryId);

    int insert(ProductCategoryBean record);

    int insertSelective(ProductCategoryBean record);

    List<ProductCategoryBean> selectByExample(ProductCategoryBeanExample example);

    ProductCategoryBean selectByPrimaryKey(Integer categoryId);

    int updateByExampleSelective(@Param("record") ProductCategoryBean record, @Param("example") ProductCategoryBeanExample example);

    int updateByExample(@Param("record") ProductCategoryBean record, @Param("example") ProductCategoryBeanExample example);

    int updateByPrimaryKeySelective(ProductCategoryBean record);

    int updateByPrimaryKey(ProductCategoryBean record);
}
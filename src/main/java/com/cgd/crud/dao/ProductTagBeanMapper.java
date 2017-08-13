package com.cgd.crud.dao;

import com.cgd.crud.bean.ProductTagBean;
import com.cgd.crud.bean.ProductTagBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductTagBeanMapper {
    long countByExample(ProductTagBeanExample example);

    int deleteByExample(ProductTagBeanExample example);

    int deleteByPrimaryKey(Integer tagId);

    int insert(ProductTagBean record);

    int insertSelective(ProductTagBean record);

    List<ProductTagBean> selectByExample(ProductTagBeanExample example);

    ProductTagBean selectByPrimaryKey(Integer tagId);

    int updateByExampleSelective(@Param("record") ProductTagBean record, @Param("example") ProductTagBeanExample example);

    int updateByExample(@Param("record") ProductTagBean record, @Param("example") ProductTagBeanExample example);

    int updateByPrimaryKeySelective(ProductTagBean record);

    int updateByPrimaryKey(ProductTagBean record);
}
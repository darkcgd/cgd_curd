package com.cgd.crud.dao;

import com.cgd.crud.bean.ProductCommentBean;
import com.cgd.crud.bean.ProductCommentBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductCommentBeanMapper {
    long countByExample(ProductCommentBeanExample example);

    int deleteByExample(ProductCommentBeanExample example);

    int deleteByPrimaryKey(Integer commentId);

    int insert(ProductCommentBean record);

    int insertSelective(ProductCommentBean record);

    List<ProductCommentBean> selectByExample(ProductCommentBeanExample example);

    ProductCommentBean selectByPrimaryKey(Integer commentId);

    int updateByExampleSelective(@Param("record") ProductCommentBean record, @Param("example") ProductCommentBeanExample example);

    int updateByExample(@Param("record") ProductCommentBean record, @Param("example") ProductCommentBeanExample example);

    int updateByPrimaryKeySelective(ProductCommentBean record);

    int updateByPrimaryKey(ProductCommentBean record);
}
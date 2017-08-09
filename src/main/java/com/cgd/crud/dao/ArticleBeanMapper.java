package com.cgd.crud.dao;

import com.cgd.crud.bean.ArticleBean;
import com.cgd.crud.bean.ArticleBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleBeanMapper {
    long countByExample(ArticleBeanExample example);

    int deleteByExample(ArticleBeanExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ArticleBean record);

    int insertSelective(ArticleBean record);

    List<ArticleBean> selectByExampleWithBLOBs(ArticleBeanExample example);

    List<ArticleBean> selectByExample(ArticleBeanExample example);

    ArticleBean selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ArticleBean record, @Param("example") ArticleBeanExample example);

    int updateByExampleWithBLOBs(@Param("record") ArticleBean record, @Param("example") ArticleBeanExample example);

    int updateByExample(@Param("record") ArticleBean record, @Param("example") ArticleBeanExample example);

    int updateByPrimaryKeySelective(ArticleBean record);

    int updateByPrimaryKeyWithBLOBs(ArticleBean record);

    int updateByPrimaryKey(ArticleBean record);
}
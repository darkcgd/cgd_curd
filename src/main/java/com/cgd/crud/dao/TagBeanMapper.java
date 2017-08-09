package com.cgd.crud.dao;

import com.cgd.crud.bean.TagBean;
import com.cgd.crud.bean.TagBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TagBeanMapper {
    long countByExample(TagBeanExample example);

    int deleteByExample(TagBeanExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TagBean record);

    int insertSelective(TagBean record);

    List<TagBean> selectByExample(TagBeanExample example);

    TagBean selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TagBean record, @Param("example") TagBeanExample example);

    int updateByExample(@Param("record") TagBean record, @Param("example") TagBeanExample example);

    int updateByPrimaryKeySelective(TagBean record);

    int updateByPrimaryKey(TagBean record);
}
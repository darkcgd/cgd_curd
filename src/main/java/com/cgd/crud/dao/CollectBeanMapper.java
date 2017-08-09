package com.cgd.crud.dao;

import com.cgd.crud.bean.CollectBean;
import com.cgd.crud.bean.CollectBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectBeanMapper {
    long countByExample(CollectBeanExample example);

    int deleteByExample(CollectBeanExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CollectBean record);

    int insertSelective(CollectBean record);

    List<CollectBean> selectByExample(CollectBeanExample example);

    CollectBean selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CollectBean record, @Param("example") CollectBeanExample example);

    int updateByExample(@Param("record") CollectBean record, @Param("example") CollectBeanExample example);

    int updateByPrimaryKeySelective(CollectBean record);

    int updateByPrimaryKey(CollectBean record);
}
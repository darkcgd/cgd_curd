package com.cgd.crud.dao;

import com.cgd.crud.bean.StatusBean;
import com.cgd.crud.bean.StatusBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StatusBeanMapper {
    long countByExample(StatusBeanExample example);

    int deleteByExample(StatusBeanExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(StatusBean record);

    int insertSelective(StatusBean record);

    List<StatusBean> selectByExample(StatusBeanExample example);

    StatusBean selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") StatusBean record, @Param("example") StatusBeanExample example);

    int updateByExample(@Param("record") StatusBean record, @Param("example") StatusBeanExample example);

    int updateByPrimaryKeySelective(StatusBean record);

    int updateByPrimaryKey(StatusBean record);
}
package com.cgd.crud.dao;

import com.cgd.crud.bean.PraiseBean;
import com.cgd.crud.bean.PraiseBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PraiseBeanMapper {
    long countByExample(PraiseBeanExample example);

    int deleteByExample(PraiseBeanExample example);

    int deleteByPrimaryKey(Integer praiseId);

    int insert(PraiseBean record);

    int insertSelective(PraiseBean record);

    List<PraiseBean> selectByExample(PraiseBeanExample example);

    PraiseBean selectByPrimaryKey(Integer praiseId);

    int updateByExampleSelective(@Param("record") PraiseBean record, @Param("example") PraiseBeanExample example);

    int updateByExample(@Param("record") PraiseBean record, @Param("example") PraiseBeanExample example);

    int updateByPrimaryKeySelective(PraiseBean record);

    int updateByPrimaryKey(PraiseBean record);
}
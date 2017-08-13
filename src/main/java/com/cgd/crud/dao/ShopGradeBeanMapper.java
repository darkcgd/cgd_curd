package com.cgd.crud.dao;

import com.cgd.crud.bean.ShopGradeBean;
import com.cgd.crud.bean.ShopGradeBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShopGradeBeanMapper {
    long countByExample(ShopGradeBeanExample example);

    int deleteByExample(ShopGradeBeanExample example);

    int deleteByPrimaryKey(Integer gradeId);

    int insert(ShopGradeBean record);

    int insertSelective(ShopGradeBean record);

    List<ShopGradeBean> selectByExample(ShopGradeBeanExample example);

    ShopGradeBean selectByPrimaryKey(Integer gradeId);

    int updateByExampleSelective(@Param("record") ShopGradeBean record, @Param("example") ShopGradeBeanExample example);

    int updateByExample(@Param("record") ShopGradeBean record, @Param("example") ShopGradeBeanExample example);

    int updateByPrimaryKeySelective(ShopGradeBean record);

    int updateByPrimaryKey(ShopGradeBean record);
}
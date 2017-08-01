package com.cgd.crud.dao;

import com.cgd.crud.bean.Qianggoubiao;
import com.cgd.crud.bean.QianggoubiaoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QianggoubiaoMapper {
    long countByExample(QianggoubiaoExample example);

    int deleteByExample(QianggoubiaoExample example);

    int deleteByPrimaryKey(Integer qianggouId);

    int insert(Qianggoubiao record);

    int insertSelective(Qianggoubiao record);

    List<Qianggoubiao> selectByExample(QianggoubiaoExample example);

    Qianggoubiao selectByPrimaryKey(Integer qianggouId);

    int updateByExampleSelective(@Param("record") Qianggoubiao record, @Param("example") QianggoubiaoExample example);

    int updateByExample(@Param("record") Qianggoubiao record, @Param("example") QianggoubiaoExample example);

    int updateByPrimaryKeySelective(Qianggoubiao record);

    int updateByPrimaryKey(Qianggoubiao record);

	List<Qianggoubiao> selectByExampleWithBrand(QianggoubiaoExample example);
}
package com.cgd.crud.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgd.crud.bean.Qianggoubiao;
import com.cgd.crud.bean.QianggoubiaoExample;
import com.cgd.crud.dao.QianggoubiaoMapper;
import com.cgd.crud.util.AbDateUtil;

@Service
public class QianggoubiaoService {
	
	@Autowired
	QianggoubiaoMapper mapper;

	/**
	 * 抢购信息保存
	 * @param data
	 */
	public void saveQianggoubiao(Qianggoubiao data) {
		data.setCreateTime(new Date());
		mapper.insert(data);
	}

	public  List<Qianggoubiao> getInfo(Qianggoubiao data) {
		QianggoubiaoExample example=new QianggoubiaoExample();  
        //通过Criteria构造查询条件  
		QianggoubiaoExample.Criteria criteria=example.createCriteria();  
        //criteria.andCreateTimeBetween(value1, value2); 
		if(data.getQianggouBrandId()!=null){
			criteria.andQianggouBrandIdEqualTo(data.getQianggouBrandId());
		}
		if(data.getQianggouPlatformId()!=null){
			criteria.andQianggouPlatformIdEqualTo(data.getQianggouPlatformId());
		}
		if(data.getQianggoubiaoTime()!=null){
			criteria.andQianggoubiaoTimeBetween(data.getQianggoubiaoTime(), AbDateUtil.tomorrow(data.getQianggoubiaoTime()));
		}
		example.setOrderByClause("qianggoubiao_time asc"); //asc 升序   desc 降序 
		
        //可能返回多条记录  
        List<Qianggoubiao> selectByExampleWithBrand = mapper.selectByExampleWithBrand(example);
        return selectByExampleWithBrand;
	}

	
	/**
	 去重复查询 
您可以在所有的Example类中调用 setDistinct(true) 方法进行强制去重复查询.

Criteria类 
Criteria 内部类的每个属性都包含 andXXX 方法，以及如下的标准的SQL查询方法:

IS NULL - 指相关的列必须为NULL 
IS NOT NULL - 指相关的列必须不为NULL 
= (equal) - 指相关的列必须等于方法参数中的值 
<> (not equal) - 指相关的列必须不等于方法参数中的值

(greater than) - 指相关的列必须大于方法参数中的值 
= (greater than or equal) - 指相关的列必须大于等于方法参数中的值 
< (less than) - 指相关的列必须小于于方法参数中的值 
<= (less than or equal) - 指相关的列必须小于等于方法参数中的值 
LIKE - 指相关的列必须 “like” 方法参数中的值. 这个方法不用必须加入 ‘%’, 您必须设置方法参数中的值. 
NOT LIKE - 指相关的列必须 “not like” 方法参数中的值. 这个方法不用必须加入 ‘%’, 您必须设置方法参数中的值. 
BETWEEN - 指相关的列必须在 “between” 方法参数中的两个值之间. 
NOT BETWEEN - 指相关的列必须不在 “not between” 方法参数中的两个值之间. 
IN - 指相关的列必须在传入的方法参数的list中. 
NOT IN - 指相关的列必须不在传入的方法参数的list中.
	 
	 */
}

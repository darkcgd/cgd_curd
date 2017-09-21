package com.cgd.crud.service;

import com.cgd.crud.bean.*;
import com.cgd.crud.dao.ProductTagBeanMapper;
import com.cgd.crud.dao.ShopBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopService {
	
	@Autowired
	ShopBeanMapper shopBeanMapper;
	/**
	 * 获取商家列表数据
	 * @return
	 */
	public List<ShopBean> getShopList() {
		return shopBeanMapper.selectByExample(null);
	}

	public ShopBean getShopDetail(Integer shopId) {
		return shopBeanMapper.selectByPrimaryKey(shopId);
	}

    public ShopBean getShopByName(String name) {
		ShopBeanExample shopBeanExample=new ShopBeanExample();
		//通过Criteria构造查询条件
		ShopBeanExample.Criteria criteria=shopBeanExample.createCriteria();
		criteria.andShopNameEqualTo(name);
		//可能返回多条记录
		List<ShopBean> list=shopBeanMapper.selectByExample(shopBeanExample);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
    }

	/**
	 * 修改商家信息(头像,昵称,性别,年龄,手机号码,更新时间,最后登陆时间等)
	 */
	public int updateShopInfo(ShopBean shopBean){
		/**
		 * 根据主键修改，空值条件不会修改成null
		 * 参数:1.要修改成的值
		 * 返回:成功修改个数
		 * updateByPrimaryKeySelective会对字段进行判断再更新(如果为Null就忽略更新)，如果你只想更新某一字段，可以用这个方法。

		 updateByPrimaryKey对你注入的字段全部更新
		 */
		return shopBeanMapper.updateByPrimaryKeySelective(shopBean);
	}

}

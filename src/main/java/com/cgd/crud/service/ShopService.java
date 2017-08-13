package com.cgd.crud.service;

import com.cgd.crud.bean.ProductTagBean;
import com.cgd.crud.bean.ShopBean;
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

}

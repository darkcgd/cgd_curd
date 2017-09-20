package com.cgd.crud.service;

import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.bean.ProductCategoryBean;
import com.cgd.crud.bean.ProductTagBean;
import com.cgd.crud.dao.ProductTagBeanMapper;
import com.cgd.crud.util.BaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductTagService {
	
	@Autowired
	ProductTagBeanMapper productTagBeanMapper;
	/**
	 * 获取所有商品标签列表数据
	 * @return
	 */
	public List<ProductTagBean> getAllProductTagList() {
		return productTagBeanMapper.selectByExample(null);
	}
	/**
	 * 根据商品标签id获取商品分类信息
	 * @return
	 */
	public ProductTagBean getProductTagById(Integer productTagId) {
		if(BaseUtil.isNotEmpty(productTagId)){
			return productTagBeanMapper.selectByPrimaryKey(productTagId);
		}
		return null;
	}
}

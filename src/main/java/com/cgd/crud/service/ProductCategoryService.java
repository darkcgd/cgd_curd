package com.cgd.crud.service;

import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.bean.ProductCategoryBean;
import com.cgd.crud.dao.ProductBeanMapper;
import com.cgd.crud.dao.ProductCategoryBeanMapper;
import com.cgd.crud.util.BaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductCategoryService {
	
	@Autowired
	ProductCategoryBeanMapper productCategoryBeanMapper;
	/**
	 * 获取商品列表数据
	 * @return
	 */
	public List<ProductCategoryBean> getAllProductCategoryList() {
		return productCategoryBeanMapper.selectByExample(null);
	}
	/**
	 * 根据商品分类id获取商品分类信息
	 * @return
	 */
	public ProductCategoryBean getProductCategoryById(Integer productCategoryId) {
		if(BaseUtil.isNotEmpty(productCategoryId)){
			return productCategoryBeanMapper.selectByPrimaryKey(productCategoryId);
		}
		return null;
	}
}

package com.cgd.crud.service;

import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.bean.ProductCategoryBean;
import com.cgd.crud.dao.ProductBeanMapper;
import com.cgd.crud.dao.ProductCategoryBeanMapper;
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
}

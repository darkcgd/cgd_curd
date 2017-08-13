package com.cgd.crud.service;

import com.cgd.crud.bean.Brand;
import com.cgd.crud.bean.CollectBean;
import com.cgd.crud.bean.CollectBeanExample;
import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.dao.BrandMapper;
import com.cgd.crud.dao.CollectBeanMapper;
import com.cgd.crud.dao.ProductBeanMapper;
import com.cgd.crud.util.BaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProductService {
	
	@Autowired
	ProductBeanMapper productBeanMapper;
	/**
	 * 获取商品列表数据
	 * @return
	 */
	public List<ProductBean> getProductList() {
		return productBeanMapper.selectByExample(null);
	}

	public ProductBean getProductDetail(Integer productId) {
		return productBeanMapper.selectByPrimaryKey(productId);
	}

}

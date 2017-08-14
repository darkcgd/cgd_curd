package com.cgd.crud.service;

import com.cgd.crud.bean.*;
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
		ProductBeanExample productBeanExample=new ProductBeanExample();
		//通过Criteria构造查询条件
		ProductBeanExample.Criteria criteria=productBeanExample.createCriteria();
		criteria.andIsSaleEqualTo(0);
		return productBeanMapper.selectByExample(productBeanExample);
	}

	public ProductBean getProductDetail(Integer productId) {
		return productBeanMapper.selectByPrimaryKey(productId);
	}

	/**
	 * 更新商品详情的阅读量
	 * @param productId
	 */
	public void updateReadCount(Integer productId) {
		productBeanMapper.updateCountByPrimaryKey(productId);
	}

	/**
	 * 将商品详情的阅读量从null置为0
	 */
	public void updateReadCountTo0(Integer productId){
		/**
		 * 根据主键修改，空值条件不会修改成null
		 * 参数:1.要修改成的值
		 * 返回:成功修改个数
		 * updateByPrimaryKeySelective会对字段进行判断再更新(如果为Null就忽略更新)，如果你只想更新某一字段，可以用这个方法。

		 updateByPrimaryKey对你注入的字段全部更新
		 */
		productBeanMapper.updateCountTo0ByPrimaryKey(productId);
	}

}

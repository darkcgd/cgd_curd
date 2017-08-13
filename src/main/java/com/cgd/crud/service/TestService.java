package com.cgd.crud.service;

import com.cgd.crud.bean.ProductTagBean;
import com.cgd.crud.dao.ProductTagBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestService {
	
	@Autowired
	ProductTagBeanMapper productTagBeanMapper;
	/**
	 * 获取所有商品标签列表数据
	 * @return
	 */
	public List<ProductTagBean> getAllProductTagList() {
		return productTagBeanMapper.selectByExample(null);
	}

}

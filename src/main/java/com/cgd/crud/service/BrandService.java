package com.cgd.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgd.crud.bean.Brand;
import com.cgd.crud.dao.BrandMapper;

@Service
public class BrandService {
	
	@Autowired
	BrandMapper mapper;
	/**
	 * 获取所有的brand品牌列表数据
	 * @param id
	 * @return
	 */
	public List<Brand> getAllBrandList() {
		return mapper.selectByExample(null);
	}
}

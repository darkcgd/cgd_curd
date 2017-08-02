package com.cgd.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgd.crud.bean.Platform;
import com.cgd.crud.dao.PlatformMapper;

@Service
public class PlatformService {
	

	@Autowired
	PlatformMapper mapper;
	/**
	 * 获取所有的platform平台列表数据
	 * @param id
	 * @return
	 */
	public List<Platform> getAllPlatFormList() {
		return mapper.selectByExample(null);
	}
}

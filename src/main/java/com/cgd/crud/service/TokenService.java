package com.cgd.crud.service;

import com.cgd.crud.bean.CollectBean;
import com.cgd.crud.bean.CollectBeanExample;
import com.cgd.crud.dao.CollectBeanMapper;
import com.cgd.crud.util.AbMd5;
import com.cgd.crud.util.BaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class TokenService {
	

	@Autowired
	CollectBeanMapper collectBeanMapper;
	/**
	 * 获取token
	 * @param userId
	 * @return
	 */
	public CollectBean getToken(Integer userId) {
		CollectBeanExample example=new CollectBeanExample();
		//通过Criteria构造查询条件
		CollectBeanExample.Criteria criteria=example.createCriteria();
		if(BaseUtil.isNotEmpty(userId)){
			criteria.andUserIdEqualTo(userId);
		}

		criteria.andUpdateTimeGreaterThanOrEqualTo(new Date());//过期时间大于等于现在时间


		List<CollectBean> collectBeans = collectBeanMapper.selectByExample(example);
		if(collectBeans!=null&&collectBeans.size()>0){
			return collectBeans.get(0);
		}
		return null;
	}

	public String generateToken(Integer userId) {
		CollectBeanExample example=new CollectBeanExample();
		//通过Criteria构造查询条件
		CollectBeanExample.Criteria criteria=example.createCriteria();
		if(BaseUtil.isNotEmpty(userId)){
			criteria.andUserIdEqualTo(userId);
		}

		List<CollectBean> collectBeans = collectBeanMapper.selectByExample(example);

		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		long nowTime=new Date().getTime();
		String str=userId+uuid+nowTime;
		String md5Str = AbMd5.MD5(str);

		if(collectBeans!=null&&collectBeans.size()>0){//说明之前已经存在该token信息,现在需要修改
			CollectBean collectBean = collectBeans.get(0);
			collectBean.setRemark(md5Str);
			Date date = new Date();
			long time = date.getTime();
			collectBean.setCreateTime(date);

			time+=1000*60*60*24*7;
			collectBean.setUpdateTime(new Date(time));
			collectBeanMapper.updateByExample(collectBean,example);

		}else{//说明之前未存在该token信息,需执行增 操作
			CollectBean collectBean=new CollectBean();
			collectBean.setUserId(userId);
			collectBean.setRemark(md5Str);
			Date date = new Date();
			long time = date.getTime();
			collectBean.setCreateTime(date);

			time+=1000*60*60*24*7;
			collectBean.setUpdateTime(new Date(time));
			collectBeanMapper.insert(collectBean);
		}
		 return md5Str;
	}
}

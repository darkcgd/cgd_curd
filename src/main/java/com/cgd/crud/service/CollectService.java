package com.cgd.crud.service;

import com.cgd.crud.bean.CollectBean;
import com.cgd.crud.bean.CollectBeanExample;
import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.dao.CollectBeanMapper;
import com.cgd.crud.dao.ProductBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CollectService {
	@Autowired
	CollectBeanMapper collectBeanMapper;

	/**
	 *
	 * @param userId
	 */
	public int doCollect(Integer collectType,Integer targetId,Integer userId) {
		int flag=0;
		CollectBeanExample example=new CollectBeanExample();
		//通过Criteria构造查询条件
		CollectBeanExample.Criteria criteria=example.createCriteria();
		criteria.andTargetTypeEqualTo(collectType);
		criteria.andTargetIdEqualTo(targetId);
		criteria.andUserIdEqualTo(userId);
		List<CollectBean> collectBeans = collectBeanMapper.selectByExample(example);
		if(collectBeans!=null&&collectBeans.size()>0){//说明之前已经收藏了,需判断isCancel字段 ,需执行改 操作
			CollectBean collectBean = collectBeans.get(0);
			collectBean.setUpdateTime(new Date());
			Integer isCancel = collectBean.getIsCancel();
			if(isCancel==null||isCancel==0){
				collectBean.setIsCancel(1);
				collectBeanMapper.updateByExample(collectBean,example);
				flag=1;
			}else{
				collectBean.setIsCancel(0);
				collectBeanMapper.updateByExample(collectBean,example);
			}
		}else{//说明之前未收藏过,需执行增 操作
			CollectBean collectBean=new CollectBean();
			collectBean.setTargetType(collectType);
			collectBean.setTargetId(targetId);
			collectBean.setUserId(userId);
			collectBean.setIsCancel(1);
			collectBean.setCreateTime(new Date());
			collectBean.setUpdateTime(new Date());
			collectBeanMapper.insert(collectBean);
			flag=1;
		}
		return flag;
	}

}

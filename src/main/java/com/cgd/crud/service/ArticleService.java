package com.cgd.crud.service;

import com.cgd.crud.bean.ArticleBean;
import com.cgd.crud.bean.ArticleBeanExample;
import com.cgd.crud.bean.CollectBean;
import com.cgd.crud.bean.CollectBeanExample;
import com.cgd.crud.dao.ArticleBeanMapper;
import com.cgd.crud.dao.CollectBeanMapper;
import com.cgd.crud.util.BaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ArticleService {
	
	@Autowired
	ArticleBeanMapper articleBeanMapper;
	@Autowired
	CollectBeanMapper collectBeanMapper;


	/**
	 * 根据id tag_id(可选)
	 * @return
	 */
	public List<ArticleBean> getArticleList(Integer tagId,String sort) {
		ArticleBeanExample example=new ArticleBeanExample();
        //通过Criteria构造查询条件  
		ArticleBeanExample.Criteria criteria=example.createCriteria();
        if(BaseUtil.isNotEmpty(tagId)){
			criteria.andTagId1EqualTo(tagId);
		}

		example.setOrderByClause("update_time "+sort); //asc 升序   desc 降序
        //返回多条记录
		List<ArticleBean> articleBeans = articleBeanMapper.selectByExample(example);
		return articleBeans;
	}
	/**
	 * 根据id tag_id(可选)
	 * @return
	 */
	public ArticleBean getArticleDetail(Integer id) {
		ArticleBeanExample example=new ArticleBeanExample();
        //通过Criteria构造查询条件
		ArticleBeanExample.Criteria criteria=example.createCriteria();
        if(BaseUtil.isNotEmpty(id)){
			criteria.andIdEqualTo(id);
		}
		ArticleBean articleBean = articleBeanMapper.selectByPrimaryKey(id);
		return articleBean;
	}

	public CollectBean getCollectDetail(Integer targetId,Integer userId) {
		CollectBeanExample example=new CollectBeanExample();
        //通过Criteria构造查询条件
		CollectBeanExample.Criteria criteria=example.createCriteria();
		if(BaseUtil.isNotEmpty(targetId)){
			criteria.andTargetIdEqualTo(targetId);
		}
		if(BaseUtil.isNotEmpty(userId)){
			criteria.andUserIdEqualTo(userId);
		}
		List<CollectBean> collectBeans = collectBeanMapper.selectByExample(example);
		if(collectBeans!=null&&collectBeans.size()>0){
			return collectBeans.get(0);
		}
		return null;
	}

	/**
	 *
	 * @param userId
	 */
	public int doCollect(Integer targetId,Integer userId) {
		int flag=0;
		/*CollectBeanExample example=new CollectBeanExample();
        //通过Criteria构造查询条件
		CollectBeanExample.Criteria criteria=example.createCriteria();
		if(BaseUtil.isNotEmpty(targetId)){
			criteria.andTargetIdEqualTo(targetId);
		}
        if(BaseUtil.isNotEmpty(userId)){
			criteria.andUserIdEqualTo(userId);
		}
		List<CollectBean> collectBeans = collectBeanMapper.selectByExample(example);
		if(collectBeans!=null&&collectBeans.size()>0){//说明之前已经收藏了,需判断isCancel字段 ,需执行改 操作
			CollectBean collectBean = collectBeans.get(0);
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
			collectBean.setTargetId(targetId);
			collectBean.setUserId(userId);
			collectBean.setIsCancel(1);
			collectBean.setCreateTime(new Date());
			collectBean.setUpdateTime(new Date());
			collectBeanMapper.insert(collectBean);
			flag=1;
		}*/
		return flag;
	}
}

package com.cgd.crud.service;

import com.cgd.crud.bean.*;
import com.cgd.crud.dao.CollectBeanMapper;
import com.cgd.crud.dao.PraiseBeanMapper;
import com.cgd.crud.dao.ProductCommentBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CommonService {
	@Autowired
	CollectBeanMapper collectBeanMapper;
	@Autowired
	PraiseBeanMapper praiseBeanMapper;
	@Autowired
	ProductCommentBeanMapper productCommentBeanMapper;

	/**
	 * 收藏与取消收藏
	 * @param collectType
	 * @param targetId
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
			Integer isCollect = collectBean.getIsCollect();
			if(isCollect==null||isCollect==0){
				collectBean.setIsCollect(1);
				collectBeanMapper.updateByExample(collectBean,example);
				flag=1;
			}else{
				collectBean.setIsCollect(0);
				collectBeanMapper.updateByExample(collectBean,example);
			}
		}else{//说明之前未收藏过,需执行增 操作
			CollectBean collectBean=new CollectBean();
			collectBean.setTargetType(collectType);
			collectBean.setTargetId(targetId);
			collectBean.setUserId(userId);
			collectBean.setIsCollect(1);
			collectBean.setCreateTime(new Date());
			collectBean.setUpdateTime(new Date());
			collectBeanMapper.insert(collectBean);
			flag=1;
		}
		return flag;
	}

	/**
	 * 点赞与取消点赞
	 * @param collectType
	 * @param targetId
	 * @param userId
	 */
	public int doPraise(Integer collectType,Integer targetId,Integer userId) {
		int flag=0;
		PraiseBeanExample example=new PraiseBeanExample();
		//通过Criteria构造查询条件
		PraiseBeanExample.Criteria criteria=example.createCriteria();
		criteria.andTargetTypeEqualTo(collectType);
		criteria.andTargetIdEqualTo(targetId);
		criteria.andUserIdEqualTo(userId);
		List<PraiseBean> praiseBeans = praiseBeanMapper.selectByExample(example);
		if(praiseBeans!=null&&praiseBeans.size()>0){//说明之前已经收藏了,需判断isCancel字段 ,需执行改 操作
			PraiseBean praiseBean = praiseBeans.get(0);
			praiseBean.setUpdateTime(new Date());
			Integer isCancel = praiseBean.getIsPraise();
			if(isCancel==null||isCancel==0){
				praiseBean.setIsPraise(1);
				praiseBeanMapper.updateByExample(praiseBean,example);
				flag=1;
			}else{
				praiseBean.setIsPraise(0);
				praiseBeanMapper.updateByExample(praiseBean,example);
			}
		}else{//说明之前未收藏过,需执行增 操作
			PraiseBean praiseBean=new PraiseBean();
			praiseBean.setTargetType(collectType);
			praiseBean.setTargetId(targetId);
			praiseBean.setUserId(userId);
			praiseBean.setIsPraise(1);
			praiseBean.setCreateTime(new Date());
			praiseBean.setUpdateTime(new Date());
			praiseBeanMapper.insert(praiseBean);
			flag=1;
		}
		return flag;
	}

	/**
	 * 根据收藏类型和收藏的目标id查询收藏的数量
	 * @param collectType
	 * @param targetId
	 * @return
	 */
	public long getCollectCount(Integer collectType,Integer targetId){
		long count=0;
		CollectBeanExample example=new CollectBeanExample();
		//通过Criteria构造查询条件
		CollectBeanExample.Criteria criteria=example.createCriteria();
		criteria.andTargetTypeEqualTo(collectType);
		criteria.andTargetIdEqualTo(targetId);
		criteria.andIsCollectEqualTo(1);
		count = collectBeanMapper.countByExample(example);
		if(count<0){
			count=0;
		}
		return count;
	}
	/**
	 * 根据点赞类型和点赞的目标id查询点赞的数量
	 * @param praiseType
	 * @param targetId
	 * @return
	 */
	public long getPraiseCount(Integer praiseType,Integer targetId){
		long count=0;
		PraiseBeanExample example=new PraiseBeanExample();
		//通过Criteria构造查询条件
		PraiseBeanExample.Criteria criteria=example.createCriteria();
		criteria.andTargetTypeEqualTo(praiseType);
		criteria.andTargetIdEqualTo(targetId);
		criteria.andIsPraiseEqualTo(1);
		count = praiseBeanMapper.countByExample(example);
		if(count<0){
			count=0;
		}
		return count;
	}


	/**
	 * 获取评论列表
	 * @param commentType  评论类型 1商品 2其他
	 * @param targetId      当commentType=1,为商品id
	 * @return
	 */
	public List<ProductCommentBean> getProductComment(Integer commentType, Integer targetId){
		ProductCommentBeanExample example=new ProductCommentBeanExample();
		//通过Criteria构造查询条件
		ProductCommentBeanExample.Criteria criteria=example.createCriteria();
		criteria.andTargetTypeEqualTo(commentType);
		criteria.andTargetIdEqualTo(targetId);
		return productCommentBeanMapper.selectByExample(example);
	}

	/**
	 * 根据评论类型和评论的目标id查询评论的数量
	 * @param praiseType
	 * @param targetId
	 * @return
	 */
	public long getProductCommentCount(Integer praiseType,Integer targetId){
		long count=0;
		ProductCommentBeanExample example=new ProductCommentBeanExample();
		//通过Criteria构造查询条件
		ProductCommentBeanExample.Criteria criteria=example.createCriteria();
		criteria.andTargetTypeEqualTo(praiseType);
		criteria.andTargetIdEqualTo(targetId);
		count = productCommentBeanMapper.countByExample(example);
		if(count<0){
			count=0;
		}
		return count;
	}

	/**
	 * 是否被收藏
	 * @param userId 用户id
	 * @param targetType 1代表商品 2代表其他
	 * @param targetId
	 * @return
	 */
	public boolean isCollect(Integer userId,Integer targetType, Integer targetId){
		CollectBeanExample example=new CollectBeanExample();
		//通过Criteria构造查询条件
		CollectBeanExample.Criteria criteria=example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andTargetTypeEqualTo(1);
		criteria.andTargetIdEqualTo(targetId);
		criteria.andIsCollectEqualTo(1);
		List<CollectBean> collectBeans = collectBeanMapper.selectByExample(example);
		if(collectBeans!=null&&collectBeans.size()>0){
			return true;
		}
		return false;
	}

	/**
	 * 是否被点赞
	 * @param userId 用户id
	 * @param targetType 1代表商品 2代表其他
	 * @param targetId
	 * @return
	 */
	public boolean isPraise(Integer userId,Integer targetType, Integer targetId){
		PraiseBeanExample example=new PraiseBeanExample();
		//通过Criteria构造查询条件
		PraiseBeanExample.Criteria criteria=example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andTargetTypeEqualTo(1);
		criteria.andTargetIdEqualTo(targetId);
		criteria.andIsPraiseEqualTo(1);
		List<PraiseBean> praiseBeans = praiseBeanMapper.selectByExample(example);
		if(praiseBeans!=null&&praiseBeans.size()>0){
			return true;
		}
		return false;
	}

}

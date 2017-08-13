package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.*;
import com.cgd.crud.service.CommonService;
import com.cgd.crud.service.ProductService;
import com.cgd.crud.service.ShopService;
import com.cgd.crud.service.UserService;
import com.cgd.crud.util.AbDateUtil;
import com.cgd.crud.util.BaseUtil;
import com.cgd.crud.util.Constant;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class CommonController extends BaseController{

	@Autowired
	ProductService productService;
	@Autowired
	ShopService shopService;
	@Autowired
	CommonService commonService;
	@Autowired
	UserService userService;


	/**
	 *
	 * @param collectType //1代表收藏商品,2代表收藏(关注)商家
	 * @param targetId   //目标id 如果collectType=1 即是商品id ....
	 * @param userId   //用户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="admin/doCollect",method= RequestMethod.GET)
	public Object doCollect(@RequestParam(value = "collectType", required=false) Integer collectType,
							@RequestParam(value = "targetId", required=false) Integer targetId,
							@RequestParam(value = "userId", required=false) Integer userId){

		if(BaseUtil.isEmpty(collectType)){
			return MsgSimple.fail("需要传collectType参数");
		}
		if(BaseUtil.isEmpty(targetId)){
			return MsgSimple.fail("需要传targetId参数");
		}
		if(collectType==1){
			if(productService.getProductDetail(targetId)==null){
				return MsgSimple.fail("该商品不存在");
			}
		}
		if(collectType==2){
			if(shopService.getShopDetail(targetId)==null){
				return MsgSimple.fail("该商家不存在");
			}
		}


		MsgBean msg;
		int flag = commonService.doCollect(collectType,targetId, userId);//1代表收藏 0代表未收藏(取消收藏)

		if(flag==1){
			msg = MsgBean.success("收藏成功");
			Map<String, Object> data = msg.getData();
			data.put("isCollect",1);
		}else{
			msg = MsgBean.success("取消收藏成功");
			Map<String, Object> data = msg.getData();
			data.put("isCollect",0);
		}
		return msg;
	}

	/**
	 *
	 * @param praiseType //1代表点赞商品,2代表点赞商家
	 * @param targetId   //目标id 如果PraiseType=1 即是商品id ....
	 * @param userId   //用户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="admin/doPraise",method= RequestMethod.GET)
	public Object doPraise(@RequestParam(value = "praiseType", required=false) Integer praiseType,
						   @RequestParam(value = "targetId", required=false) Integer targetId,
						   @RequestParam(value = "userId", required=false) Integer userId){

		if(BaseUtil.isEmpty(praiseType)){
			return MsgSimple.fail("需要传praiseType参数");
		}
		if(BaseUtil.isEmpty(targetId)){
			return MsgSimple.fail("需要传targetId参数");
		}
		if(praiseType==1){
			if(productService.getProductDetail(targetId)==null){
				return MsgSimple.fail("该商品不存在");
			}
		}

		if(praiseType==2){
			if(shopService.getShopDetail(targetId)==null){
				return MsgSimple.fail("该商家不存在");
			}
		}

		MsgBean msg;
		int flag = commonService.doPraise(praiseType,targetId, userId);//1代表点赞 0代表未点赞(取消点赞)

		if(flag==1){
			msg = MsgBean.success("点赞成功");
			Map<String, Object> data = msg.getData();
			data.put("isPraise",1);
		}else{
			msg = MsgBean.success("取消点赞成功");
			Map<String, Object> data = msg.getData();
			data.put("isPraise",0);
		}
		return msg;
	}

	/**
	 *
	 * @param commentType  评论类型 1商品 2其他
	 * @param targetId      当commentType=1,为商品id
	 * @param pagerNumber
	 * @param pagerSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getCommentList",method=RequestMethod.GET)
	public Object getCommentList(@RequestParam(value = "commentType", required=false) Integer commentType,
								 @RequestParam(value = "targetId", required=false) Integer targetId,
								 @RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								 @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){

		if(BaseUtil.isEmpty(commentType)){
			return MsgSimple.fail("需要传commentType参数");
		}
		if(BaseUtil.isEmpty(targetId)){
			return MsgSimple.fail("需要传targetId参数");
		}

		PageHelper.startPage(pagerNumber, pagerSize);
		List<ProductCommentBean> productComment = commonService.getProductComment(commentType, targetId);
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		handlerPageInfo(data,new PageInfo(productComment, pagerSize));
		List<Map<String,Object>> productCommentResults=new ArrayList<>();
		for (ProductCommentBean productCommentBean:productComment) {
			Map<String,Object> map = new HashMap<>();
			List<String> imageStr=setCommentImage(productCommentBean);
			map.put("commentId", productCommentBean.getCommentId());
			map.put("targetId", productCommentBean.getTargetId());
			map.put("targetType", productCommentBean.getTargetType());

			Date createTime = productCommentBean.getCreateTime();
			if(createTime!=null){
				String stringByFormat = AbDateUtil.getStringByFormat(createTime, "yyyy-MM-dd HH:mm");
				map.put("createTime", stringByFormat);
			}else{
				map.put("createTime", null);
			}

			Integer createUserId = productCommentBean.getCreateUserId();
			if(createUserId!=null){
				User userById = userService.getUserById(createUserId);
				map.put("createUserId", createUserId);
				map.put("createUserName", userById.getUserName());
				map.put("createUserHeadUrl", userById.getHeadUrl());
			}else{
				map.put("createUserId", null);
				map.put("createUserName", null);
				map.put("createUserHeadUrl", null);
			}
			map.put("content", productCommentBean.getContent());
			map.put("image", imageStr);
			map.put("remark", productCommentBean.getRemark());
			productCommentResults.add(map);
		}
		data.put("list", productCommentResults);
		return msg;
	}


	private List<String> setCommentImage(ProductCommentBean productCommentBean) {
		List<String> imageStr=new ArrayList<>();
		if(BaseUtil.isNotEmpty(productCommentBean.getImage1())){
			imageStr.add(productCommentBean.getImage1());
		}
		if(BaseUtil.isNotEmpty(productCommentBean.getImage2())){
			imageStr.add(productCommentBean.getImage2());
		}
		if(BaseUtil.isNotEmpty(productCommentBean.getImage3())){
			imageStr.add(productCommentBean.getImage3());
		}
		return imageStr;
	}


}

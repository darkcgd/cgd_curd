package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.MsgSimple;
import com.cgd.crud.bean.ProductBean;
import com.cgd.crud.service.CommonService;
import com.cgd.crud.service.ProductService;
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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController extends BaseController{

	@Autowired
	ProductService productService;
	@Autowired
	CommonService commonService;


	@ResponseBody
	@RequestMapping(value="/getProductList",method=RequestMethod.GET)
	public MsgBean getProductList(@RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
								  @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		PageHelper.startPage(pagerNumber, pagerSize);
		List<ProductBean> info = productService.getProductList();
		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		handlerPageInfo(data,new PageInfo(info, pagerSize));
		data.put("list", info);
		return msg;
	}

	@ResponseBody
	@RequestMapping(value="/getProductDetail",method=RequestMethod.GET)
	public Object getProductDetail(@RequestParam(value = "productId", required=false) Integer productId){
		if(BaseUtil.isEmpty(productId)){
			return MsgSimple.fail("需要传productId参数");
		}
		ProductBean productDetail = productService.getProductDetail(productId);
		if(productDetail!=null){
			long collectCount = commonService.getCollectCount(1, productId);
			long praiseCount = commonService.getPraiseCount(1, productId);
			List<String> imageStr=setProductImage(productDetail);

			MsgBean msg = MsgBean.success("获取成功");
			Map<String, Object> data = msg.getData();
			data.put("productId", productDetail.getProductId());
			data.put("productName", productDetail.getProductName());
			data.put("productCode", productDetail.getProductCode());
			data.put("logo", productDetail.getLogo());
			data.put("image",imageStr);
			data.put("title", productDetail.getTitle());
			data.put("buyPrice", productDetail.getBuyPrice());
			data.put("originalPrice", productDetail.getOriginalPrice());
			data.put("nowPrice", productDetail.getNowPrice());
			data.put("discount", productDetail.getDiscount());
			data.put("productTagId", productDetail.getProductTagId());
			data.put("graphicDetail", productDetail.getGraphicDetail());
			data.put("isSale", productDetail.getIsSale());
			data.put("shopId", productDetail.getShopId());
			data.put("summary", productDetail.getSummary());
			data.put("collectCount", collectCount);
			data.put("praiseCount", praiseCount);
			return msg;
		}else{
			return MsgBean.fail("查询不到该商品");
		}
	}

	private List<String> setProductImage(ProductBean productDetail) {
		List<String> imageStr=new ArrayList<>();
		if(BaseUtil.isNotEmpty(productDetail.getImage1())){
			imageStr.add(productDetail.getImage1());
		}
		if(BaseUtil.isNotEmpty(productDetail.getImage2())){
			imageStr.add(productDetail.getImage2());
		}
		if(BaseUtil.isNotEmpty(productDetail.getImage3())){
			imageStr.add(productDetail.getImage3());
		}
		if(BaseUtil.isNotEmpty(productDetail.getImage4())){
			imageStr.add(productDetail.getImage4());
		}
		if(BaseUtil.isNotEmpty(productDetail.getImage5())){
			imageStr.add(productDetail.getImage5());
		}
		return imageStr;
	}

}

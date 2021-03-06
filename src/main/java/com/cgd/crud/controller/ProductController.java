package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.*;
import com.cgd.crud.service.*;
import com.cgd.crud.util.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class ProductController extends BaseController{

	@Autowired
	ProductService productService;
	@Autowired
	CommonService commonService;
	@Autowired
	OrderService orderService;
	@Autowired
	TokenService tokenService;
	@Autowired
	ProductCategoryService productCategoryService;
	@Autowired
	ProductTagService productTagService;

	/**
	 * @return
	 */
	@RequestMapping("/shop/addProduct")
	@ResponseBody
	public MsgBean addProduct(@Valid ProductBean data, BindingResult result,@RequestParam(value = "file")MultipartFile file,
							  @RequestParam("multipartFile") MultipartFile[] multipartFile, HttpServletRequest request) throws IOException {
		saveFileLogo(file,data,request);
		saveFileImage(multipartFile,data,request);


		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return MsgBean.fail().add("errorFields", map);
		}else{
			if(data!=null){
				productService.addProduct(data);
				return MsgBean.success("添加成功");
			}
			return MsgBean.success("添加失败");
		}
	}

	private void saveFileLogo(MultipartFile file,ProductBean data, HttpServletRequest request)  throws IOException {
		if(file!=null&&data!=null&&request!=null){
			String path = UtilPath.getRootPath().replace("target/cgd-crud-1.0/","src/main/webapp/")+"upload";//D:/workspace/cgd-curd/target/cgd-crud-1.0/
			//String path = request.getSession().getServletContext().getRealPath("upload");
			String fileName = file.getOriginalFilename();
			if(BaseUtil.isNotEmpty(fileName)){
				String fileNamePath = AbFileUtil.getFilePath(path,fileName);

				File filePath = new File(path + fileNamePath);

				if(!filePath.exists()){
					filePath.mkdirs();
				}
				//MultipartFile自带的解析方法
				file.transferTo(filePath);
				data.setLogo("upload"+fileNamePath);
			}
		}
	}
	private void saveFileImage(MultipartFile[] file,ProductBean data, HttpServletRequest request)  throws IOException {
		if(file!=null&&data!=null&&request!=null){
			MultipartFile multipartFile;
			for (int i = 0; i < file.length; i++) {
				multipartFile = file[i];
				String path = UtilPath.getRootPath().replace("target/cgd-crud-1.0/","src/main/webapp/")+"upload";//D:/workspace/cgd-curd/target/cgd-crud-1.0/
				//String path = request.getSession().getServletContext().getRealPath("upload");
				String fileName = multipartFile.getOriginalFilename();
				if(BaseUtil.isNotEmpty(fileName)){
					String fileNamePath = AbFileUtil.getFilePath(path,fileName);

					File filePath = new File(path + fileNamePath);

					if(!filePath.exists()){
						filePath.mkdirs();
					}
					//MultipartFile自带的解析方法
					multipartFile.transferTo(filePath);
					if(i==0){
						data.setImage1("upload"+fileNamePath);
					}else if(i==1){
						data.setImage2("upload"+fileNamePath);
					}else if(i==2){
						data.setImage3("upload"+fileNamePath);
					}else if(i==3){
						data.setImage4("upload"+fileNamePath);
					}else if(i==4){
						data.setImage5("upload"+fileNamePath);
					}
				}
			}
		}
	}




	@ResponseBody
	@RequestMapping(value="/getProductList",method=RequestMethod.GET)
	public MsgBean getProductList(
			@RequestParam(value = "userId", required=false) Integer userId,
			@RequestParam(value = "token", required=false) String token,
			@RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
			@RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		return getProductListMethod(userId,token,pagerNumber,pagerSize,1);
	}

	@ResponseBody
	@RequestMapping(value="/shop/getProductList",method=RequestMethod.GET)
	public MsgBean getAdminProductList(
			@RequestParam(value = "userId", required=false) Integer userId,
			@RequestParam(value = "token", required=false) String token,
			@RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
			@RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize){
		return getProductListMethod(userId,token,pagerNumber,pagerSize,0);
	}

	/**
	 * @param userId
	 * @param token
	 * @param pagerNumber
	 * @param pagerSize
	 * @param type 0代表admin 1代表是普通用户 用于区分是否返回isSale==1 的数据
	 * @return
	 */
	private MsgBean getProductListMethod(Integer userId,String token,Integer pagerNumber,Integer pagerSize,int type){
		PageHelper.startPage(pagerNumber, pagerSize);

		boolean isVaild=false;
		if(userId!=null&&token!=null){
			TokenBean tokenBean = tokenService.getToken(userId,0);
			if(tokenBean!=null){
				String saveToken = tokenBean.getToken();
				if(saveToken!=null&&saveToken.equals(token)){
					isVaild=true;
				}
			}
		}
		if(!isVaild){
			userId=null;//如果验证userId和token不通过,则把userId置为null
		}
		List<ProductBean> info = productService.getProductListBySql(userId,type);

		MsgBean msg = MsgBean.success("获取成功");
		Map<String, Object> data = msg.getData();
		if(type==0){
			handlerPageInfoAdmin(data,new PageInfo(info, pagerSize));
		}else{
			handlerPageInfo(data,new PageInfo(info, pagerSize));
		}
		List<Map<String,Object>> productBeanResults=new ArrayList<>();
		for (ProductBean productBean:info) {
			Integer productId = productBean.getProductId();
			long collectCount = commonService.getCollectCount(1, productId);
			long praiseCount = commonService.getPraiseCount(1, productId);
			long productCommentCount = commonService.getProductCommentCount(1, productId);
			long saleCount = orderService.getOrderCount(productId);
			Map<String,Object> map = new HashMap<>();
			List<String> imageStr=setProductImage(productBean);
			map.put("productId", productId);
			map.put("productName", productBean.getProductName());
			map.put("productCode", productBean.getProductCode());
			map.put("logo", productBean.getLogo());
			map.put("image",imageStr);
			map.put("title", productBean.getTitle());
			map.put("buyPrice", productBean.getBuyPrice());
			map.put("originalPrice", productBean.getOriginalPrice());
			map.put("nowPrice", productBean.getNowPrice());
			map.put("discount", productBean.getDiscount());
			map.put("productTagId", productBean.getProductTagId());
			map.put("graphicDetail", productBean.getGraphicDetail());
			map.put("isSale", productBean.getIsSale());
			map.put("shopId", productBean.getShopId());
			map.put("summary", productBean.getSummary());
			map.put("collectCount", collectCount);
			map.put("praiseCount", praiseCount);
			map.put("commentCount", productCommentCount);
			map.put("saleCount", saleCount);
			CollectBean collectBean = productBean.getCollectBean();
			PraiseBean praiseBean = productBean.getPraiseBean();
			if(collectBean!=null&&collectBean.getIsCollect()==1){
				map.put("isCollect",true);
			}else{
				map.put("isCollect",false);
			}
			if(praiseBean!=null&&praiseBean.getIsPraise()==1){
				map.put("isPraise",true);
			}else{
				map.put("isPraise",false);
			}
			productBeanResults.add(map);
		}
		data.put("list", productBeanResults);
		return msg;
	}


	@ResponseBody
	@RequestMapping(value="/getProductDetail",method=RequestMethod.GET)
	public Object getProductDetail(
			@RequestParam(value = "userId", required=false) Integer userId,
			@RequestParam(value = "token", required=false) String token,
			@RequestParam(value = "productId", required=false) Integer productId){
		if(BaseUtil.isEmpty(productId)){
			return MsgSimple.fail("需要传productId参数");
		}
		ProductBean productDetail = productService.getProductDetail(productId);
		if(productDetail!=null){
			//插入阅读量
			productService.updateReadCount(productId);

			boolean isCollect = false;
			boolean isPraise = false;
			if(userId!=null&&token!=null){
				TokenBean tokenBean = tokenService.getToken(userId,0);
				if(tokenBean!=null){
					String saveToken = tokenBean.getToken();
					if(saveToken!=null&&saveToken.equals(token)){
						isCollect = commonService.isCollect(userId, 1, productId);
						isPraise = commonService.isPraise(userId, 1, productId);
					}
				}
			}

			long collectCount = commonService.getCollectCount(1, productId);
			long praiseCount = commonService.getPraiseCount(1, productId);
			long productCommentCount = commonService.getProductCommentCount(1, productId);
			long saleCount = orderService.getOrderCount(productId);
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
			data.put("categoryId", productDetail.getCategoryId());
			data.put("graphicDetail", productDetail.getGraphicDetail());
			data.put("isSale", productDetail.getIsSale()==null?0:productDetail.getIsSale());//1上架0下架
			data.put("shopId", productDetail.getShopId());
			data.put("summary", productDetail.getSummary());
			data.put("collectCount", collectCount);
			data.put("praiseCount", praiseCount);
			data.put("commentCount", productCommentCount);
			data.put("saleCount", saleCount);
			data.put("isCollect", isCollect);
			data.put("isPraise", isPraise);
			if(productDetail.getReadCount()==null){
				productService.updateReadCountTo0(productId);
				data.put("readCount", 1);
			}else{
				data.put("readCount", productDetail.getReadCount()+1);
			}
			if(BaseUtil.isNotEmpty(productDetail.getCategoryId())){
				ProductCategoryBean productCategory = productCategoryService.getProductCategoryById(productDetail.getCategoryId());
				if(productCategory!=null){
					data.put("categoryName", productCategory.getCategoryName());
				}
			}
			if(BaseUtil.isNotEmpty(productDetail.getCategoryId())){
				ProductTagBean productTag = productTagService.getProductTagById(productDetail.getProductTagId());
				if(productTag!=null){
					data.put("tagName", productTag.getTagName());
				}
			}

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



	@ResponseBody
	@RequestMapping(value="/shop/doDeleteProductById",method=RequestMethod.GET)
	public Object doDeleteProductById(@RequestParam(value = "productId", required=false) Integer productId){
		if(BaseUtil.isEmpty(productId)){
			return MsgSimple.fail("需要传productId参数");
		}
		productService.doDeleteProductById(productId);
		return MsgSimple.success("删除成功");
	}

	@ResponseBody
	@RequestMapping(value="/shop/doDeleteProductByIds",method=RequestMethod.DELETE)
	public Object doDeleteProductByIds(@RequestParam(value = "ids", required=false) Integer[] ids){
		if(ids==null&&ids.length<1){
			return MsgSimple.fail("至少需要传一个productId");
		}
		productService.doDeleteProductByIds(Arrays.asList(ids));
		return MsgSimple.success("删除成功");
	}

	@ResponseBody
	@RequestMapping("/shop/doUpdateProduct")
	public Object doUpdateProduct(@Valid ProductBean data, BindingResult result,@RequestParam(value = "file")MultipartFile file,
								  @RequestParam("multipartFile") MultipartFile[] multipartFile, HttpServletRequest request) throws IOException {
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return MsgBean.fail().add("errorFields", map);
		}else{
			saveFileLogo(file,data,request);
			saveFileImage(multipartFile,data,request);
			if(BaseUtil.isEmpty(data.getProductId())){
				return MsgSimple.fail("需要传productId参数");
			}
			productService.doUpdateProductById(data);
			return MsgSimple.success("修改成功");
		}

	}



}

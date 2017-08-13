package com.cgd.crud.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.bean.Qianggoubiao;
import com.cgd.crud.service.QianggoubiaoService;
import com.cgd.crud.util.Constant;
import com.cgd.crud.util.SortUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/qianggoubiao") 
public class QianggoubiaoController extends BaseController{

	@Autowired
	QianggoubiaoService service;
	
	/**
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.GET)
	@ResponseBody
	public MsgBean saveQianggoubiao(@Valid Qianggoubiao data, BindingResult result){
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
				service.saveQianggoubiao(data);
				return MsgBean.success("保存成功");
			}
			return MsgBean.success("保存失败");
		}
	}
	
	/**
	 * 参考 http://blog.csdn.net/whu_zcj/article/details/53506572
	 * 获取抢购表信息(重要)
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getInfo")
	public MsgBean getInfo(@Valid Qianggoubiao qianggoubiao,
						   @RequestParam(value = "pagerNumber", defaultValue = ""+Constant.DefaultPagerNumber) Integer pagerNumber,
						   @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize,
						   BindingResult result){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return MsgBean.fail().add("errorMsg", map);
		}else{
			// 这不是一个分页查询
			// 引入PageHelper分页插件
			// 在查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pagerNumber, pagerSize);
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数 new PageInfo(info, pagerSize)
			List<Qianggoubiao> info = service.getInfo(qianggoubiao);
			
	        String [] sortNameArr = {"qianggoubiaoTime","brandName","platformName","qianngouName"};
	        boolean [] isAscArr = {true,true,true,true};
	        SortUtil.sort(info,sortNameArr,isAscArr);  
			
			
			MsgBean msg = MsgBean.success("获取成功");
			Map<String, Object> data = msg.getData();
			handlerPageInfo(data,new PageInfo(info, pagerSize));
			data.put("list", info);
			return msg;
		}
		
	}
	
}

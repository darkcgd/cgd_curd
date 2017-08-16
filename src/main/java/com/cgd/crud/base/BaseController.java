package com.cgd.crud.base;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import com.cgd.crud.util.AbDateUtil;
import com.cgd.crud.util.BaseUtil;
import com.github.pagehelper.PageInfo;

public class BaseController {
	/**
	 *  分页时处理返回页码数据
	 * @param data 封装返回数据的map
	 * @param page 页码数据
	 */
	public void handlerPageInfo(Map<String, Object> data,PageInfo page){
		if(page.getList().size()>0){
			data.put("pagerNumber", page.getPageNum());
			data.put("pagerSize", page.getPageSize());
			data.put("totalCount", page.getTotal());
			data.put("isLastPage", page.isIsLastPage());
			data.put("isFirstPage", page.isIsFirstPage());
		}
	}

	/**
	 * 将数据库中Date类型转为日期字符串格式
	 * @param map
	 * @param field
	 * @param date
	 * @param format
	 */
	public void handlerDateToStr(Map<String,Object> map,String field,Date date,String format){
		if(BaseUtil.isNotEmpty(date)){
			map.put(field, AbDateUtil.getStringByFormat(date,format));
		}else{
			map.put("confirmTime", date);
		}
	}

	public double handlerBigDecimal(BigDecimal bigDecimal){
		if(bigDecimal==null){
			return 0.00d;
		}else{
			return bigDecimal.doubleValue();
		}
	}
}

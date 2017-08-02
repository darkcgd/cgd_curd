package base;

import java.util.Map;

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
}

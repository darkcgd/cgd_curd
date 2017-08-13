package com.cgd.crud.controller;

import com.cgd.crud.base.BaseController;
import com.cgd.crud.bean.ArticleBean;
import com.cgd.crud.bean.CollectBean;
import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.service.ArticleService;
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

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class ArticleController extends BaseController{

    @Autowired
    ArticleService articleService;

    /**
     * 获取新闻列表
     * @return
     */
    @RequestMapping(value="/getArticleList",method= RequestMethod.GET)
    @ResponseBody
    public MsgBean getArticleList(
            @Valid ArticleBean articleBean,
            @RequestParam(value = "pagerNumber", defaultValue = ""+ Constant.DefaultPagerNumber) Integer pagerNumber,
                             @RequestParam(value = "pagerSize", defaultValue = ""+Constant.DefaultPagerSize) Integer pagerSize,
                             @RequestParam(value = "tagId", defaultValue = "0") Integer tagId,
                             @RequestParam(value = "sort", defaultValue = "desc") String sort//asc 升序   desc 降序
                             ){

        List<ArticleBean> articleList = articleService.getArticleList(tagId,sort);
        PageHelper.startPage(pagerNumber, pagerSize);

        MsgBean msg = MsgBean.success("获取成功");
        Map<String, Object> data = msg.getData();
        handlerPageInfo(data,new PageInfo(articleList, pagerSize));
        data.put("list", articleList);
        return msg;
    }


    /**
     * 获取新闻详情
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getArticleDetail",method= RequestMethod.GET)
    public MsgBean getArticleDetail(@RequestParam("id") Integer id,
                                    @RequestParam(value = "userId", defaultValue = "0") Integer userId
                            ){
        ArticleBean articleDetail = articleService.getArticleDetail(id);
        if(articleDetail!=null){
            MsgBean msg = MsgBean.success("获取成功");
            Map<String, Object> data = msg.getData();
            data.put("data",articleDetail);
            if(userId!=null){
                CollectBean collectDetail = articleService.getCollectDetail(id,userId);
                if(collectDetail!=null){
                    Integer isCancel = collectDetail.getIsCancel();//1代表收藏 0代表未收藏(取消收藏)
                    if(isCancel==null){
                        isCancel=0;
                    }
                    data.put("isCollect",isCancel);
                }else{
                    data.put("isCollect",0);
                }
            }else{
                data.put("isCollect",0);
            }
            return msg;
        }else{
            return MsgBean.fail("获取不到该文章");
        }

    }

}

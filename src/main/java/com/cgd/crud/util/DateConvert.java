package com.cgd.crud.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 全局日期处理类
 * Convert<T,S>
 *         泛型T:代表客户端提交的参数 String
 *         泛型S:通过convert转换的类型
   
 */
public class DateConvert implements Converter<String, Date> {

    //可以转换的格式,用数组的形式进行存储
    private static final SimpleDateFormat[] ACCEPT_DATE_FORMATS = {
            //这个必须放到前面
            //否则按照年月日时分进行匹配,匹配成功直接转换为0时0分
            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
            new SimpleDateFormat("yyyy-MM-dd HH:mm"),
            new SimpleDateFormat("yyyy-MM-dd")
    };

    @Override
    public Date convert(String dateStr) {
        //空串不进行处理返回null
        if(dateStr == "")
            return null;

        //看是否满足某种格式
        for(SimpleDateFormat format : ACCEPT_DATE_FORMATS){
            try{
                Date tmp = format.parse(dateStr);
                return tmp;
            }catch (Exception e) {
                e.printStackTrace();
                continue;
            }
        }

        //所有格式都不满足返回null
        return null;
    }

}


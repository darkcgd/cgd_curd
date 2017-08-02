package com.cgd.crud.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TestJavaMethod {
	public static void main(String[] args) {
		String stringDate="2017-08-02";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
        	Date parse = simpleDateFormat.parse(stringDate);
        	System.out.println(parse);
        	Date tomorrow = tomorrow(parse);
            System.out.println(tomorrow);
        } catch (ParseException e) {
            e.printStackTrace();
        }
		
	}
	
	
	
	/**
	 * 返回昨天
	 * @param today
	 * @return
	 */
	 public static Date yesterday(Date today) {
	 Calendar calendar = Calendar.getInstance();
	 calendar.setTime(today);
	 calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
	 return calendar.getTime();
	 }
	 
	 /**
	 * 返回明天
	 * @param today
	 * @return
	 */
	 public static  Date tomorrow(Date today) {
	 Calendar calendar = Calendar.getInstance();
	 calendar.setTime(today);
	 calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
	 return calendar.getTime();
	 }
}

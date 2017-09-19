package com.cgd.crud.test;

import com.cgd.crud.util.AbMd5;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class TestJavaMethod {
	public static void main(String[] args) {
		testStr();
		//testTime();
		//testToken();
		//testDate();
	}

	private static void testStr() {
		String content="这是一段关于小程序的关键字高亮的文本";
		while (true){

		}
	}

	private static void testTime() {
		String timestr="7250";
		long a = Long.parseLong(timestr);
		long hour=a/3600;    //!小时
		long minute=a%3600/60+hour*60;  //!分钟
		long second=a%60;        //!秒
		System.out.println(hour+":"+minute+":"+second);


	}


	private static void testToken(){
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		String userId="43";
		long nowTime=new Date().getTime();
		String str=userId+uuid+nowTime;
		String md5Str = AbMd5.MD5(str);
		System.out.println(md5Str);
	}

	private static void testDate(){
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

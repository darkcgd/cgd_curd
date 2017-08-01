package com.cgd.crud.test;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class TestJavaMethod {
	public static void main(String[] args) {
		System.out.println("aaa");
		
		List<String> list=new ArrayList<>();
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		Gson gson=new Gson();
		String json = gson.toJson(list);
		System.out.println(json);
		 List<String> retList = gson.fromJson(json,  
	                new TypeToken<List<String>>() {  
	                }.getType()); 
		 System.out.println(retList.toString());
		
	}
}

package com.cgd.crud.test.myjvm;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by szmg on 17/8/24.
 */
public class Test {
    public static void main(String[] args) {
        Map<String, Object> map = new HashMap<>();
        Object abc = map.put("abc", "123");
        String a = "abcd";
        int i = a.hashCode();

        Object abc1 = map.put("abc", "1234");

        int aa = a.hashCode() >>> 16;
        System.out.println(i + ":::" + aa);
    }
}
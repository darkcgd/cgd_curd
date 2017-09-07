package com.cgd.crud.test.myhashmap;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by szmg on 17/8/28.
 */
public class TestHashMap {
    /**
     * @author Arpit Mandliya
     */
    public static void main(String[] args) {
        Map map=new HashMap<>();
        map.put("c",123);
        map.put("b",789);
        map.put("d",456);
        map.put("a",23);



        ConcurrentHashMap<String ,Object> concurrentHashMap=new ConcurrentHashMap<>();

        System.out.println(map);

        LinkedHashMap<String,Object> linkedHashMap=new LinkedHashMap<>();
        linkedHashMap.put("c",123);
        linkedHashMap.put("b",789);
        linkedHashMap.put("d",456);
        linkedHashMap.put("a",23);


        System.out.println(linkedHashMap);


        TreeMap treeMap=new TreeMap(map);
        System.out.println(treeMap);
    }
}

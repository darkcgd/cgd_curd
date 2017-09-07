package com.cgd.crud.test.myaop;

/**
 * Created by szmg on 17/9/6.
 */
public interface Book {
    void addBook();
    void addBookNew();//动态代理的好处,,接口中增加新的方法 代理类不需要作修改  静态代理需要做修改
}

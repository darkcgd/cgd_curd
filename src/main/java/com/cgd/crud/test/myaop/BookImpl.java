package com.cgd.crud.test.myaop;

/**
 * Created by szmg on 17/9/6.
 */
public class BookImpl implements Book{
    @Override
    public void addBook() {
        System.out.println("增加图书方法");
    }

    @Override
    public void addBookNew() {
        System.out.println("增加图书最新方法");
    }
}

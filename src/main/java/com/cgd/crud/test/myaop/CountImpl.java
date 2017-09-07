package com.cgd.crud.test.myaop;

/**
 * Created by szmg on 17/9/6.
 */
public class CountImpl implements Count{


    @Override
    public void selectCount() {
        System.out.println("查看账户方法...");
    }

    @Override
    public void updateCount() {
        System.out.println("修改账户方法...");
    }

    @Override
    public void updateCountNew() {

    }
}

package com.cgd.crud.test.myaop;

/**
 * 这是一个代理类（增强CountImpl实现类）
 * Created by szmg on 17/9/6.
 */
public class CountProxy implements Count{
    private CountImpl countImpl;

    public CountProxy(CountImpl countImpl){
        this.countImpl=countImpl;
    }

    @Override
    public void selectCount() {
        System.out.println("事务处理之前");
        // 调用委托类的方法;
        countImpl.selectCount();
        System.out.println("事务处理之后");
    }

    @Override
    public void updateCount() {
        System.out.println("事务处理之前");
        // 调用委托类的方法;
        countImpl.updateCount();
        System.out.println("事务处理之后");
    }

    @Override
    public void updateCountNew() {

    }
}

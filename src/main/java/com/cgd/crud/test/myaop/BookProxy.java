package com.cgd.crud.test.myaop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Created by szmg on 17/9/6.
 */
public class BookProxy implements InvocationHandler{
    private Object target;

    public Object bind(Object target){
        this.target=target;
        ////要绑定接口(这是一个缺陷，cglib弥补了这一缺陷)
        return Proxy.newProxyInstance(target.getClass().getClassLoader(),target.getClass().getInterfaces(),this);
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("事务开始");
        Object result=method.invoke(target,args);
        System.out.println("事务结束");
        return result;
    }
}

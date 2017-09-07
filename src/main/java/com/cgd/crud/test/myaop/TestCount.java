package com.cgd.crud.test.myaop;

/**
 * Created by szmg on 17/9/6.
 */
public class TestCount {
    public static void main(String[] args) {
        CountImpl countImpl = new CountImpl();
        CountProxy countProxy=new CountProxy(countImpl);
        countProxy.selectCount();
        countProxy.updateCount();
    }
}

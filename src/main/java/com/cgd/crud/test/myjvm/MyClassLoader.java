package com.cgd.crud.test.myjvm;

/**
 * Created by szmg on 17/8/21.
 */
public class MyClassLoader extends ClassLoader{

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {

        return super.findClass(name);
    }
}

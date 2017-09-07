package com.cgd.crud.test.myaop;

/**
 * Created by szmg on 17/9/6.
 */
public class TestBookProxy {
    public static void main(String[] args) {
        BookProxy bookProxy=new BookProxy();
        Book book = (Book) bookProxy.bind(new BookImpl());
        book.addBookNew();
    }
}

package com.cgd.crud.test.myspring;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.xml.DefaultBeanDefinitionDocumentReader;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by szmg on 17/8/31.
 */
public class TestSpring {
    public static void main(String[] args) {
        DefaultBeanDefinitionDocumentReader defaultBeanDefinitionDocumentReader=new DefaultBeanDefinitionDocumentReader();
        Resource resource = new ClassPathResource("/Users/szmg/cgd/java_workspace/cgd_curd/src/main/java/com/cgd/crud/test/myspring/screen_rotate.xml");
        try {
            String filename = resource.getFilename();
            System.out.println(filename);
            if (resource.isReadable()) {
                //每次都会打开一个新的流
                InputStream is = resource.getInputStream();
                System.out.println(is.available());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

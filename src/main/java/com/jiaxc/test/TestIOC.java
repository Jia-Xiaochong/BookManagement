package com.jiaxc.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestIOC {
    ApplicationContext applicationContext;

    @Before
    public void before() {
        System.out.println("开始引入配置类");
        applicationContext =  new ClassPathXmlApplicationContext("spring-mybatis.xml");
    }

    @Test
    public void iocTest() {

        String[] names = applicationContext.getBeanDefinitionNames();
        for (String name : names) {
            System.out.println(name);
        }

    }

}

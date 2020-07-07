package com.jiaxc.test;

import com.jiaxc.controller.TestController;
import org.apache.commons.lang3.time.DateUtils;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.ui.ConcurrentModel;
import org.springframework.ui.Model;

import java.util.Date;

public class TestConfig {
    @Test
    public void t() {
        System.out.println(new Date());
        System.out.println(DateUtils.addDays(new Date(), 30));
    }
    @Test
    public void test() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-mybatis.xml");
        //ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        //UserService userService = (UserService) applicationContext.getBean("userService");
        TestController testController = (TestController) applicationContext.getBean("mainController");
        Model model = new ConcurrentModel();
        //System.out.println(mainController.selectUserById(2, model));
        // System.out.println(userService.selectUserById(2).getUsername());
    }
}

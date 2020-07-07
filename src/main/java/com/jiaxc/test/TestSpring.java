package com.jiaxc.test;

import com.jiaxc.pojo.User;
import com.jiaxc.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestSpring {
    @Test
    public void testSpring() {
        // 获取Spring容器
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 从容器获取对象
        UserService userService = (UserService) applicationContext.getBean("userService");
        // 操作对象
        User user = userService.selectUserById(1);
        if(user != null){
            System.out.println(user.getUsername());
        }else{
            System.out.println("没有找到用户!");
        }
    }
}

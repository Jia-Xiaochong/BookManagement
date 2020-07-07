package com.jiaxc.test;

import com.jiaxc.mapper.UserDao;
import com.jiaxc.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;

public class TestMyBatis {

    @Test
    public void testMyBatis() throws IOException {
        // 加载配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis/mybitas-config.xml");
        // 创建SqlSessionFactory对象
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // 创建SqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        // 获取代理对象
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        // 操作代理对象
        User u = userDao.selectUserById(1);
        System.out.println(u.getUsername());
        // 关闭资源
        sqlSession.close();
        inputStream.close();
    }

}

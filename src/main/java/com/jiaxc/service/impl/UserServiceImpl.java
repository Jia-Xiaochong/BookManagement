package com.jiaxc.service.impl;

import com.jiaxc.mapper.UserDao;
import com.jiaxc.pojo.User;
import com.jiaxc.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service(value = "userService")
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Resource
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public int addOneUser(User user) {
        return userDao.addOneUser(user);
    }

    @Override
    public User selectUserById(int uid) {
        return this.userDao.selectUserById(uid);
    }

    @Override
    public User selectUserByName(String username) {
        return this.userDao.selectUserByName(username);
    }

}

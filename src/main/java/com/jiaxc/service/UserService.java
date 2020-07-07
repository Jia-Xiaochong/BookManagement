package com.jiaxc.service;

import com.jiaxc.pojo.User;

public interface UserService {
    public int addOneUser(User user);
    public User selectUserById(int uid);
    public User selectUserByName(String username);
}

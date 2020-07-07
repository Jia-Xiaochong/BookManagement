package com.jiaxc.mapper;

import com.jiaxc.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "userDao")
public interface UserDao {
    public int delUser(int uid);
    public List<User> getAllUser();
    public int addOneUser(User user);
    public User selectUserById(int uid);
    public User selectUserByName(String username);
    public User userLogin(User user);
}

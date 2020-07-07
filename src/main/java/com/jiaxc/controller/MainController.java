package com.jiaxc.controller;

import com.alibaba.fastjson.JSONObject;
import com.jiaxc.mapper.ActionDao;
import com.jiaxc.mapper.BookDao;
import com.jiaxc.mapper.UserDao;
import com.jiaxc.pojo.Action;
import com.jiaxc.pojo.Book;
import com.jiaxc.pojo.User;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Resource
    private UserDao userDao;
    @Resource
    private BookDao bookDao;
    @Resource
    private ActionDao actionDao;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String userLogin(HttpServletRequest request, User user, Model model) {
        User user1 = this.userDao.selectUserByName(user.getUsername());
        if(user1.getPassword().equals(user.getPassword())){
            request.getSession().setAttribute("user", user1);
            if(user1.getLevel().equals("超级管理员") || user1.getLevel().equals("管理员")){
                return "redirect:/admin";
            } else{
                return "redirect:/main";
            }
        } else {
            model.addAttribute("msg", "错误");
            return "login";
        }
    }

    // 个人信息展示
    @RequestMapping("/mypage")
    public String toMypage(HttpSession httpSession, Model model) {
        User user = (User) httpSession.getAttribute("user");
        List<Action> actions = this.actionDao.selectActionByUid(user.getUid());
        model.addAttribute("actions", actions);
        return "mypage";
    }

    // 图书信息展示
    @RequestMapping("/showbook/{bid}")
    public String shoeBook(HttpSession httpSession, @PathVariable("bid") int bid, Action action, Model model) {
        // 获取对象
        User user = (User) httpSession.getAttribute("user");
        Book book = this.bookDao.selectBookById(bid);
        // 设置参数
        action.setBid(bid);
        action.setUid(user.getUid());
        action.setState("待还");
        if(book != null) {
            if(this.actionDao.selectByUidBid(action)>0){
                model.addAttribute("state", "待还");
            } else if(book.getStock() > 0) {
                model.addAttribute("state", "可借");
            }
            model.addAttribute("book", book);
        } else {
            model.addAttribute("msg", "未找到图书！！！");
        }
        // 返回图书展示页面
        return "showbook";
    }

    // 图书-借书
    @RequestMapping("/showbook/borrowBook/{bid}")
    public String borrowBook(HttpServletRequest request, @PathVariable("bid") int bid, Action action, Model model){
        // 获取对象
        User user = (User) request.getSession().getAttribute("user");
        // 设置参数
        action.setBid(bid);
        action.setUid(user.getUid());
        Date date = new Date();
        action.setStarttime(date);
        action.setDeadline(DateUtils.addDays(new Date(), 30));
        // 添加借书操作记录
        this.actionDao.addAction(action);
        // 图书数量减一
        this.bookDao.delOneBookByBid(bid);
        // 返回图书展示页面
        return "redirect:/showbook/" + bid;
    }

    // 图书-还书
    @RequestMapping("/showbook/returnBook/{bid}")
    public String returnBook(HttpServletRequest request, @PathVariable("bid") int bid, Action action){
        // 对象获取
        User user = (User) request.getSession().getAttribute("user");
        Book book = this.bookDao.selectBookById(bid);
        // 数据设置
        action.setUid(user.getUid());
        action.setBid(bid);
        action.setDeadline(new Date());
        action.setState("已还");
        // 修改借书操作记录
        this.actionDao.returnBookAction(action);
        // 图书数量加一
        this.bookDao.addOneBookByBid(bid);
        // 返回图书展示页面
        return "redirect:/showbook/" + bid;
    }
    @RequestMapping("/mypage/returnBook/{bid}")
    public String returnBook2(HttpServletRequest request, @PathVariable("bid") int bid, Action action){
        // 对象获取
        User user = (User) request.getSession().getAttribute("user");
        Book book = this.bookDao.selectBookById(bid);
        // 数据设置
        action.setUid(user.getUid());
        action.setBid(bid);
        action.setDeadline(new Date());
        action.setState("已还");
        // 修改借书操作记录
        this.actionDao.returnBookAction(action);
        // 图书数量加一
        this.bookDao.addOneBookByBid(bid);
        // 返回图书展示页面
        return "redirect:/mypage";
    }

    // 图书-延期
    @RequestMapping("/showbook/returnDelay/{bid}")
    public String returnDelay(HttpServletRequest request, @PathVariable("bid") int bid, Action action){
        // 对象获取
        User user = (User) request.getSession().getAttribute("user");
        // 参数设置
        action.setBid(bid);
        action.setUid(user.getUid());
        // 执行延期操作
        this.actionDao.returnBookDelay(action);
        // 返回图书展示页面
        return "redirect:/showbook/" + bid;
    }
    @RequestMapping("/mypage/returnDelay/{bid}")
    public String returnDelay2(HttpServletRequest request, @PathVariable("bid") int bid, Action action){
        // 对象获取
        User user = (User) request.getSession().getAttribute("user");
        // 参数设置
        action.setBid(bid);
        action.setUid(user.getUid());
        // 执行延期操作
        this.actionDao.returnBookDelay(action);
        // 返回图书展示页面
        return "redirect:/mypage";
    }

    //
    @RequestMapping(value = "/search", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String search(@RequestBody String jsonString, Model model){
        JSONObject jsonObject = JSONObject.parseObject(jsonString);
        String search = '%' + jsonObject.getString("search") + '%';
        List<Book> books = null;
        if (jsonObject.getString("tag").equals("bookname")){
            books = bookDao.getBooksByName(search);
        } else if (jsonObject.getString("tag").equals("author")) {
            books = bookDao.getBooksByAuthor(search);
        } else if (jsonObject.getString("tag").equals("press")) {
            books = bookDao.getBooksByPress(search);
        } else if (jsonObject.getString("tag").equals("tag")) {
            books = bookDao.getBooksByTag(search);
        }
        JSONObject json = new JSONObject();
        json.put("books", books);
        return json.toString();
    }

}

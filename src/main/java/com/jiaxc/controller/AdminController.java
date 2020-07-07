package com.jiaxc.controller;

import com.jiaxc.mapper.ActionDao;
import com.jiaxc.mapper.BookDao;
import com.jiaxc.mapper.UserDao;
import com.jiaxc.pojo.Book;
import com.jiaxc.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class AdminController {

    @Resource
    private UserDao userDao;
    @Resource
    private BookDao bookDao;
    @Resource
    private ActionDao actionDao;

    @RequestMapping("/main")
    public String index(Model model){
        List<Book> bookList = bookDao.selectAllBook();
        model.addAttribute("booklist", bookList);
        return "main";
    }

    // 管理员首页
    @RequestMapping("/admin")
    public String admin(Model mode){
        List<Book> bookList = bookDao.selectAllBook();
        mode.addAttribute("bookList", bookList);
        return "admin/admin";
    }

    // 添加图书
    @RequestMapping(value = "/addBook", method = RequestMethod.GET)
    public String addBookGet(){
        return "admin/addBook";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    public String addBookPost(Book book, Model model){
        if (bookDao.addOneBook(book)>0){
            model.addAttribute("msg", "添加成功！");
        } else {
            model.addAttribute("msg", "添加失败！");
        }
        return "admin/addBook";
    }

    // 展示图书信息
    @RequestMapping("/adminShowBook/{bid}")
    public String adminShowBook(@PathVariable("bid") int bid, Model model){
        Book book = bookDao.selectBookById(bid);
        model.addAttribute("book", book);
        return "admin/adminShowBook";
    }

    // 修改图书信息
    @RequestMapping(value = "/editBook/{bid}", method = RequestMethod.GET)
    public String editBookGet(@PathVariable("bid") int bid, Model model){
        Book book = bookDao.selectBookById(bid);
        model.addAttribute("book", book);
        return "admin/editBook";
    }

    @RequestMapping(value = "/editBook", method = RequestMethod.POST)
    public String editBookPost(Book book){
        bookDao.editOneBook(book);
        return "redirect:/adminShowBook/"+book.getBid();
    }

    // 删除图书
    @RequestMapping("/delBook/{bid}")
    public String delBook(@PathVariable("bid") int bid, Model model){
        Book book = bookDao.selectBookById(bid);
        if(book.getStock()==book.getTotal()){
            bookDao.delBook(bid);
            model.addAttribute("msg", "已删除！");
        } else {
            model.addAttribute("msg", "图书并未全部收回，无法删除！");
        }
        List<Book> bookList = bookDao.selectAllBook();
        model.addAttribute("bookList", bookList);
        return "admin/admin";
    }

    // 添加用户
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUserGet(){
        return "admin/addUser";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUserPost(User user, Model model){
        if (user.getLevel().equals("admin")){
            user.setLevel("管理员");
        } else {
            user.setLevel("普通用户");
        }
        if (userDao.addOneUser(user)>0){
            model.addAttribute("msg", "添加成功！");
        } else {
            model.addAttribute("msg", "添加失败！");
        }
        return "admin/addUser";
    }

    // 用户列表
    @RequestMapping("/userList")
    public String userList(Model model){
        List<User> users = userDao.getAllUser();
        model.addAttribute("users", users);
        return "admin/userList";
    }

    // 删除用户
    @RequestMapping("/delUser/{uid}")
    public String delUser(@PathVariable("uid") int uid, Model model){
        int num = actionDao.getNumByUid(uid);
        if (num > 0) {
            model.addAttribute("msg", "此人未还完书籍！！！");
        } else {
            userDao.delUser(uid);
            model.addAttribute("msg", "删除完成！！！");
        }
        List<User> users = userDao.getAllUser();
        model.addAttribute("users", users);
        return "admin/userList";
    }
}

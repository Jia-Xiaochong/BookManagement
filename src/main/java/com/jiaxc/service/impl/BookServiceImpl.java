package com.jiaxc.service.impl;

import com.jiaxc.mapper.BookDao;
import com.jiaxc.pojo.Book;
import com.jiaxc.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service(value = "bookService")
public class BookServiceImpl implements BookService {

    @Resource(name = "bookDao")
    private BookDao bookDao;

    @Override
    public int addOneBook(Book book) {
        return this.bookDao.addOneBook(book);
    }

    @Override
    public int delOneBookByBid(int bid) {
        return this.bookDao.delOneBookByBid(bid);
    }

    @Override
    public int addOneBookByBid(int bid) {
        return this.bookDao.addOneBookByBid(bid);
    }

    @Override
    public Book selectBookById(int bid) {
        return this.bookDao.selectBookById(bid);
    }

    @Override
    public List<Book> selectAllBook() {
        return this.bookDao.selectAllBook();
    }

}

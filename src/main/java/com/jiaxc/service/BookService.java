package com.jiaxc.service;

import com.jiaxc.pojo.Book;

import java.util.List;

public interface BookService {
    public int addOneBook(Book book);
    public int delOneBookByBid(int bid);
    public int addOneBookByBid(int bid);
    public Book selectBookById(int bid);
    public List<Book> selectAllBook();
}

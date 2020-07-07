package com.jiaxc.mapper;

import com.jiaxc.pojo.Book;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository(value = "bookDao")
public interface BookDao {
    public List<Book> getBooksByName(String search);
    public List<Book> getBooksByAuthor(String search);
    public List<Book> getBooksByPress(String search);
    public List<Book> getBooksByTag(String search);
    public int editOneBook(Book book);
    public int delBook(int bid);
    public int addOneBook(Book book);
    public int delOneBookByBid(int bid);
    public int addOneBookByBid(int bid);
    public Book selectBookById(int bid);
    public List<Book> selectAllBook();
}

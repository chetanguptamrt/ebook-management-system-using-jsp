/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.admin;

import com.detail.BookDetail;
import java.util.List;

/**
 *
 * @author chetan
 */
public interface BookDAOinterFace {
    
    public String addBook(BookDetail bd, StringBuilder photoExt);
    public List<BookDetail> showBook(int pageNo);
    public int bookCount();
    public void deleteBook(int id);
    public BookDetail editBookDetail(int bookId);
    public String editBook(BookDetail bd);
}

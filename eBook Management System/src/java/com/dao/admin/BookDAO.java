/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.admin;

import com.detail.BookDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author chetan
 */
public class BookDAO implements BookDAOinterFace {

    private final Connection conn;
    
    public BookDAO(Connection conn){
        super();
        this.conn = conn;
    }
    
    @Override
    public synchronized String addBook(BookDetail bd, StringBuilder photoExt) {
        try{
            String query1 = "select * from book where photo = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            String photoName;
            while(true) {
                photoName = randomFileName(bd.getBookCategory(),photoExt);
                pt1.setString(1, photoName);
                ResultSet rs1 = pt1.executeQuery();
                if(!rs1.next()){
                    break;
                }
            }
            String query = "insert into book (bookName,authorName,price,bookCategory,available,photo) values(?,?,?,?,?,?);";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, bd.getBookName());
            pt.setString(2, bd.getAuthorName());
            pt.setInt(3, bd.getPrice());
            pt.setString(4, bd.getBookCategory());
            pt.setInt(5, bd.getAvailable());
            pt.setString(6, photoName);
            int i = pt.executeUpdate();
            if(i==1){
                return photoName;
            }
        } catch(SQLException e){
            e.printStackTrace();;
        }
        return "no";
    }
    
    private String randomFileName(String pre, StringBuilder post){
        int i = (int)(Math.random()*(999999999-111111111+1)+111111111);
        return pre+i+"."+post;
    }
    
    @Override
    public List<BookDetail> showBook(int pageNo){
        List<BookDetail> list = new ArrayList<BookDetail>();
        BookDetail bd;
        try{
            String query = "SELECT * FROM book LIMIT 10 OFFSET "+((pageNo-1)*10);
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()) {
                bd = new BookDetail();
                bd.setId(rs.getInt("bookId"));
                bd.setBookName(rs.getString("bookName"));
                bd.setAuthorName(rs.getString("authorName"));
                bd.setPrice(rs.getInt("price"));
                bd.setBookCategory(rs.getString("bookCategory"));
                bd.setAvailable(rs.getInt("available"));
                bd.setPhoto(rs.getString("photo"));
                list.add(bd);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public int bookCount(){
        int page = 1;
        try{
            String query = "SELECT COUNT(bookId) AS total FROM book";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                page = rs.getInt("total");
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return page;
    }
    
    @Override
    public void deleteBook(int id){
        try {
            String query = "DELETE FROM book where bookId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    @Override
    public BookDetail editBookDetail(int bookId){
        BookDetail bd = null;
        try{
            String query = "SELECT * FROM book where bookId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, bookId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()) {
                bd = new BookDetail();
                bd.setId(rs.getInt("bookId"));
                bd.setBookName(rs.getString("bookName"));
                bd.setAuthorName(rs.getString("authorName"));
                bd.setPrice(rs.getInt("price"));
                bd.setBookCategory(rs.getString("bookCategory"));
                bd.setAvailable(rs.getInt("available"));
                bd.setPhoto(rs.getString("photo"));
            } else{
                return null;
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return bd;
    }
    
    @Override
    public String editBook(BookDetail bd){
        try{
            String query = "update book set bookName = ?, authorName = ?, price = ?, bookCategory = ?, available = ? where bookId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, bd.getBookName());
            pt.setString(2, bd.getAuthorName());
            pt.setInt(3, bd.getPrice());
            pt.setString(4, bd.getBookCategory());
            pt.setInt(5, bd.getAvailable());
            pt.setInt(6, bd.getId());
            int i = pt.executeUpdate();
            if(i==1) {
                return "done";
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return "no";
    }
    
}

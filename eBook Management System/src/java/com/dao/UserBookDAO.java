/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.detail.BookDetail;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author chetan
 */
public class UserBookDAO {
    
    private final Connection conn;

    public UserBookDAO(Connection conn) {
        this.conn = conn;
    }

    public List<BookDetail> newBook(){
        List<BookDetail> list = new ArrayList<BookDetail>();
        BookDetail bd;
        try{
            String query = "SELECT * FROM book WHERE bookCategory = 'new' ORDER BY bookId DESC LIMIT 8";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                bd = new BookDetail();
                bd.setId(rs.getInt("bookId"));
                bd.setAuthorName(rs.getString("authorName"));
                bd.setAvailable(rs.getInt("available"));
                bd.setBookCategory(rs.getString("bookCategory"));
                bd.setBookName(rs.getString("bookName"));
                bd.setPhoto(rs.getString("photo"));
                bd.setPrice(rs.getInt("price"));
                list.add(bd);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDetail> oldBook(){
        List<BookDetail> list = new ArrayList<BookDetail>();
        BookDetail bd;
        try{
            String query = "SELECT * FROM book WHERE bookCategory = 'old' ORDER BY bookId DESC LIMIT 4";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                bd = new BookDetail();
                bd.setId(rs.getInt("bookId"));
                bd.setAuthorName(rs.getString("authorName"));
                bd.setAvailable(rs.getInt("available"));
                bd.setBookCategory(rs.getString("bookCategory"));
                bd.setBookName(rs.getString("bookName"));
                bd.setPhoto(rs.getString("photo"));
                bd.setPrice(rs.getInt("price"));
                list.add(bd);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int countNewBook(){
        int pageNo = 1;
        try{
            String query = "SELECT count(*) AS total FROM book WHERE bookCategory = 'new'";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                pageNo = rs.getInt("total");
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return pageNo;
    }
    
    public int countOldBook(){
        int pageNo = 1;
        try{
            String query = "SELECT count(*) AS total FROM book WHERE bookCategory = 'old'";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                pageNo = rs.getInt("total");
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return pageNo;
    }

    public List<BookDetail> newBookByPageNo(int pageNo){
        List<BookDetail> list = new ArrayList<BookDetail>();
        BookDetail bd;
        try{
            String query = "SELECT * FROM book WHERE bookCategory = 'new' LIMIT 20 OFFSET "+((pageNo-1)*20);
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                bd = new BookDetail();
                bd.setId(rs.getInt("bookId"));
                bd.setAuthorName(rs.getString("authorName"));
                bd.setAvailable(rs.getInt("available"));
                bd.setBookCategory(rs.getString("bookCategory"));
                bd.setBookName(rs.getString("bookName"));
                bd.setPhoto(rs.getString("photo"));
                bd.setPrice(rs.getInt("price"));
                list.add(bd);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDetail> oldBookByPageNo(int pageNo) {
        List<BookDetail> list = new ArrayList<BookDetail>();
        BookDetail bd;
        try{
            String query = "SELECT * FROM book WHERE bookCategory = 'old' LIMIT 20 OFFSET "+((pageNo-1)*20);
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                bd = new BookDetail();
                bd.setId(rs.getInt("bookId"));
                bd.setAuthorName(rs.getString("authorName"));
                bd.setAvailable(rs.getInt("available"));
                bd.setBookCategory(rs.getString("bookCategory"));
                bd.setBookName(rs.getString("bookName"));
                bd.setPhoto(rs.getString("photo"));
                bd.setPrice(rs.getInt("price"));
                list.add(bd);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
   
}

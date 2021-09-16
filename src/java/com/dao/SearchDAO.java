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
public class SearchDAO {
    
    private Connection conn;

    public SearchDAO(Connection conn) {
        this.conn = conn;
    }
    
    public List<BookDetail> newBookSearch(String query, int pageNo) {
        List<BookDetail> list = new ArrayList<BookDetail>();
        BookDetail bd;
        try {
            PreparedStatement pt = conn.prepareStatement((query+" LIMIT 20 OFFSET "+((pageNo-1)*20)));
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
    
    public int newBookSearchPageCount(String query){
        int total = 1;
        try{
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                total = rs.getInt("total");
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return total;
    }
}

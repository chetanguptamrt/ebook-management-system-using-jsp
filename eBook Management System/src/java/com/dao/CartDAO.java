/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.detail.CartDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chetan
 */
public class CartDAO {
    
    private final Connection conn;

    public CartDAO(Connection conn) {
        this.conn = conn;
    }
 
    public String insertCart(int bookId, int userId){
        try {
            String query = "select * from cart where userId = ? and bookId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            pt.setInt(2, bookId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                return "no";
            } else {
                String query1 = "insert into cart (userId,bookId) values(?,?)";
                PreparedStatement pt1 = conn.prepareStatement(query1);
                pt1.setInt(1, userId);
                pt1.setInt(2, bookId);
                int i = pt1.executeUpdate();
                if(i==1) {
                    return "done";
                }
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return "no";
    }
 
    public String deleteCart(int bookId, int userId){
        try {
            String query = "delete from cart where userId = ? and bookId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            pt.setInt(2, bookId);
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return "no";
    }

    public int totalCart(int userId){
        try {
            String query = "select count(*) as total from cart where userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                return rs.getInt("total");
            } 
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public List<CartDetail> getCart(int userId){
        List<CartDetail> list = new ArrayList<CartDetail>();
        CartDetail cd;
        try {
            String query1 = "select * from cart where userId = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setInt(1, userId);
            ResultSet rs1 = pt1.executeQuery();
            while(rs1.next()){
                String query2 = "select * from book where bookId = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setInt(1, rs1.getInt("bookId"));
                ResultSet rs2 = pt2.executeQuery();
                if(rs2.next()){
                    cd = new CartDetail();
                    cd.setBookId(rs1.getInt("bookId"));
                    cd.setBookName(rs2.getString("bookName"));
                    cd.setAuthorName(rs2.getString("authorName"));
                    cd.setPhoto(rs2.getString("photo"));
                    cd.setPrice(rs2.getInt("price"));
                    cd.setQuantity(rs1.getInt("quantity"));
                    list.add(cd);
                }
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
        
}

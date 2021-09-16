/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.detail.ShippingDetail;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author chetan
 */
public class ShippingDAO {
    
    private final Connection conn;

    public ShippingDAO(Connection conn) {
        this.conn = conn;
    }
    
    public String insertAddress(ShippingDetail sd){
        try {
            String query = "select * from shipping where userId = ?";
            PreparedStatement pt1 = conn.prepareStatement(query);
            pt1.setInt(1, sd.getUserId());
            ResultSet rs1 = pt1.executeQuery();
            if(rs1.next()) {
                String query2 = "update shipping set name = ?, phone = ?, address1 = ?, address2 = ?, landmark = ?, city = ?, pincode = ? where userId = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, sd.getName());
                pt2.setString(2, sd.getPhone());
                pt2.setString(3, sd.getAddress1());
                pt2.setString(4, sd.getAddress2());
                pt2.setString(5, sd.getLandmark());
                pt2.setString(6, sd.getCity());
                pt2.setString(7, sd.getPinCode());
                pt2.setInt(8, sd.getUserId());
                int i = pt2.executeUpdate();
                if(i == 1) {
                    return "done";
                }
            } else{
                String query2 = "insert into shipping (name, phone, address1, address2, landmark, city, pincode, userId) values(?,?,?,?,?,?,?,?)";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, sd.getName());
                pt2.setString(2, sd.getPhone());
                pt2.setString(3, sd.getAddress1());
                pt2.setString(4, sd.getAddress2());
                pt2.setString(5, sd.getLandmark());
                pt2.setString(6, sd.getCity());
                pt2.setString(7, sd.getPinCode());
                pt2.setInt(8, sd.getUserId());
                int i = pt2.executeUpdate();
                if(i == 1) {
                    return "done";
                }
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return "no";
    }
    
    public ShippingDetail getAddress(int userId){
        ShippingDetail sd = null;
        try{
            String query = "select * from shipping where userId = ?";
            PreparedStatement pt1 = conn.prepareStatement(query);
            pt1.setInt(1, userId);
            ResultSet rs1 = pt1.executeQuery();
            if(rs1.next()) {
                sd = new ShippingDetail();
                sd.setName(rs1.getString("name"));
                sd.setPhone(rs1.getString("phone"));
                sd.setAddress1(rs1.getString("address1"));
                sd.setAddress2(rs1.getString("address2"));
                sd.setLandmark(rs1.getString("landmark"));
                sd.setCity(rs1.getString("city"));
                sd.setPinCode(rs1.getString("pincode"));
                sd.setUserId(rs1.getInt("userId"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return sd;
    }
    
}

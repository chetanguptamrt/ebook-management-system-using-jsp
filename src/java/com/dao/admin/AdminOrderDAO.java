/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.admin;

import com.detail.OrderCartList;
import com.detail.OrderListDetail;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chetan
 */
public class AdminOrderDAO {
 
    private final Connection conn;

    public AdminOrderDAO(Connection conn) {
        this.conn = conn;
    }
    
     public List<OrderListDetail> getOrderList() {
       List<OrderListDetail> list = new ArrayList<OrderListDetail>();
       OrderListDetail cd;
        try {
            String query1 = "select * from orderlist where status = 'no'";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            ResultSet rs1 = pt1.executeQuery();
            while(rs1.next()){
                cd = new OrderListDetail();
                cd.setOrderID(rs1.getInt("orderId"));
                cd.setPaymentMethod(rs1.getString("paymentMethod"));
                cd.setPrice(rs1.getInt("price"));
                cd.setStatus(rs1.getString("status"));
                cd.setDate(rs1.getTimestamp("time").toString());
                list.add(cd);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
       
       return list;
    }
      
    public OrderListDetail getOrderView(int orderId) {
        OrderListDetail cd = null;
        try {
            String query1 = "select * from orderlist where orderId = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setInt(1, orderId);
            ResultSet rs1 = pt1.executeQuery();
            while(rs1.next()){
                cd = new OrderListDetail();
                cd.setOrderID(rs1.getInt("orderId"));
                cd.setPaymentMethod(rs1.getString("paymentMethod"));
                cd.setPrice(rs1.getInt("price"));
                cd.setStatus(rs1.getString("status"));
                cd.setDate(rs1.getTimestamp("time").toString());
                cd.setName(rs1.getString("name"));
                cd.setPhone(rs1.getString("phone"));
                cd.setAddress1(rs1.getString("address1"));
                cd.setAddress2(rs1.getString("address2"));
                cd.setLandmark(rs1.getString("landmark"));
                cd.setCity(rs1.getString("city"));
                cd.setPinCode(rs1.getString("pincode"));
                String query2 = "select * from ordercart where orderId = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setInt(1, orderId);
                ResultSet rs2 = pt2.executeQuery();
                List<OrderCartList> list = new ArrayList<OrderCartList>();
                OrderCartList ocl;
                while(rs2.next()) {
                    ocl = new OrderCartList();
                    ocl.setBookName(rs2.getString("bookName"));
                    ocl.setAuthorName(rs2.getString("authorName"));
                    ocl.setPrice(rs2.getInt("price"));
                    ocl.setQuantity(rs2.getInt("quantity"));
                    list.add(ocl);
                }
                cd.setOcl(list);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
       return cd;
   }
    
    public String deliveredOrder(int orderId){
        try {
            String query1 = "update orderlist set status = 'Delivered' where orderId = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setInt(1, orderId);
            int i = pt1.executeUpdate();
            if(i==1){
                return "done";
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return "no";
    }
    
}

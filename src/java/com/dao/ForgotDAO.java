/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import com.javaclass.Email;
import com.javaclass.PasswordEncrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
        
/**
 *
 * @author chetan
 */
public class ForgotDAO {
    
    public String sendOTP(String email){
        try{
            Connection conn = DBConnect.getConnection();
            String query = "delete from forgot where email = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            pt.executeUpdate();
            String query3 = "select * from useraccount where email = ?";
            PreparedStatement pt3 = conn.prepareStatement(query3);
            pt3.setString(1, email);
            ResultSet rs = pt3.executeQuery();
            if(rs.next()){
                int otp = getOTP();
                String subject = "One Time Password";
                String body = "Hello "+rs.getString("name")+",\n\n"
                        + "Your OTP is : "+otp+"\n\n"
                        + "If you are having any issue with your account, please don't hesitate to contact us.\n\n"
                        + "Thanks!\n"
                        + "Quiz Maker";
                Thread td = new Thread(new Email(email, subject, body));
                td.start();
                String query2 = "insert into forgot (email,otp) values(?,?)";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, email);
                pt2.setInt(2, otp);
                int j = pt2.executeUpdate();
                if(j==1){
                    return "done";
                }                    
            } else{
                return "noUser";
            }
        } catch (SQLException ex) {
            Logger.getLogger(ForgotDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
    
    public String checkOTP(String email, int otp, String password){
        try{
            Connection conn = DBConnect.getConnection();
            String query = "select * from forgot where email = ? and otp = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            pt.setInt(2, otp);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                String ePassword = PasswordEncrypt.hashPassword(password);
                String query2 = "update useraccount set password = ?, active = true where email = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, ePassword);
                pt2.setString(2, email);
                int i = pt2.executeUpdate();
                if(i==1){
                    String query3 = "delete from forgot where email = ?";
                    PreparedStatement pt3 = conn.prepareStatement(query3);
                    pt3.setString(1, email);
                    pt3.executeUpdate();
                    return "done";
                }
            } else {
                return "invalid";
            }
        } catch (SQLException ex) {
            Logger.getLogger(ForgotDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
    
    private int getOTP(){
       return (int)(Math.random()*(999999-111111+1)+111111);
    }
}
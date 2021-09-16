/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.admin;
import com.database.DBConnect;
import com.detail.AdminDetail;
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
public class AdminDAO {
    public String adminLogin(AdminDetail ad){
        try{
            String ePassword = PasswordEncrypt.hashPassword(ad.getPassword());
            String query = "select * from admin where userName = ? and password = ?";
            Connection conn = DBConnect.getConnection();
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, ad.getUserName());
            pt.setString(2, ePassword);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                return "done";
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "no";
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author chetan
 */
public class DBConnect {
    
    private static Connection conn;
    
    public static Connection getConnection(){
        try{
            if(conn==null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmanagementsystem", "root", "Champ123@");
            }
        } catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return conn;
    }
    
}

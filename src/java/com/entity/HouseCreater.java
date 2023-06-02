/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;


/**
 *
 * @author Administrator
 */
public class HouseCreater {

    
        
    private static House houses[] ;

    
     public static House[] getConnection() {
         
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM houses");
            ResultSet rs = pst.executeQuery();

          
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
              

            }
 

        } catch (Exception e) {
            e.printStackTrace();
        }
          return houses;
         
     }

    public static House[] getHouses() {
        return houses;
    }

}

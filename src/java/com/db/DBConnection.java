 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author hp
 */
public class DBConnection {
    
    private static Connection conn;
    public static Connection getConn(){
        
        try{
            
            if(conn==null){
               Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","mysql");
            }
        }
            catch(Exception e)
            {
                    e.printStackTrace();
                    
            }
        return conn;
        }
    }


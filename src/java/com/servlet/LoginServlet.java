/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;


import com.dao.userDAO;
import com.db.DBConnection;
import com.entity.user;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author hp
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    @Override 
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
     {
         try{
             String em=req.getParameter("email");
             String ps=req.getParameter("pas");
             user u=new user();
             HttpSession session=req.getSession();
             
             if("admin@gmail.com".equals(em)&& "admin@121".equals(ps)){
                 session.setAttribute("userobj", u);
                 u.setRole("admin");
                 resp.sendRedirect("admin.jsp");
             }  
             else{
                 userDAO dao=new userDAO(DBConnection.getConn());
                user user= dao.login(em,ps);
                if(user!=null){
                    session.setAttribute("userobj",user);
                    resp.sendRedirect("home.jsp");
                }
                else{
                    session.setAttribute("succMsg","Invalid Email & Password");
                    resp.sendRedirect("login.jsp");
                }
             }
         }
         catch(Exception e){
             e.printStackTrace();
         }
     }   
    
}

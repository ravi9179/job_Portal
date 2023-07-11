/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.userDAO;
import com.db.DBConnection;
import com.entity.user;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet{
    @Override 
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
     
         try{
               String name=req.getParameter("name");
             String qua=req.getParameter("qua");
             String email=req.getParameter("email");
             String ps=req.getParameter("ps");
             
             userDAO dao =new userDAO(DBConnection.getConn());
             user u=new user(name,qua,email,ps,"User");
             boolean f=dao.addUser(u);
             HttpSession session =req.getSession();
              if(f){
             session.setAttribute("succmsg","Job Registration Successfully");
             resp.sendRedirect("signup.jsp");
            }
         else{
             session.setAttribute("succmsg","Something wrong on server");
             resp.sendRedirect("signup.jsp");
             
         }
             
         }
         catch(Exception e){
             e.printStackTrace();
         }
}
}
 
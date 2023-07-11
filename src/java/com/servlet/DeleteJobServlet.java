/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.jobDAO;
import com.db.DBConnection;
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
@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet  {
       
     @Override
     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
         
         try{
             int id=Integer.parseInt(req.getParameter("id"));
            jobDAO dao=new jobDAO(DBConnection.getConn());
           boolean f=dao.deletejobs(id);
           HttpSession session=req.getSession();
         
        
         if(f){
             session.setAttribute("Succmsg","Job Deldete Successfully");
             resp.sendRedirect("view_job.jsp");
            }
         else{
             session.setAttribute("Succmsg","Something wrong on server");
             resp.sendRedirect("view_job.jsp");
         }
           
         }
         catch(Exception e){
             e.printStackTrace();
         }
     }
    
}

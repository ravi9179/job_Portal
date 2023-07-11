/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.jobDAO;
import com.db.DBConnection;
import com.entity.jobs;
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
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    
    @Override 
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
     
         
         try{
             int id=Integer.parseInt(req.getParameter("id"));
             String title=req.getParameter("title");
          String location=req.getParameter("location");
           String category=req.getParameter("category");
            String status=req.getParameter("status");
             String desc=req.getParameter("desc");
             
             jobs j=new jobs();
             j.setId(id);
             j.setTitle(title);
             j.setDescription(location);
             j.setLocation(location);
             j.setCategory(category);
             j.setStatus(status);
              HttpSession session=req.getSession();
         
         jobDAO dao=new jobDAO(DBConnection.getConn());
         boolean f=dao.updatejobs(j);
         if(f){
             session.setAttribute("Succmsg","Job Update Successfully");
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

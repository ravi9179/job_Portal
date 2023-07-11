/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.entity.jobs;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp
 */
public class jobDAO {
        private Connection conn;
        public jobDAO(Connection conn){
            super();
               this.conn=conn;
               
        }
        
        public boolean add_jobs(jobs j){
            
            
            boolean f=false;
            try{
                String sql="INSERT INTO jobs(title,description,category,status,location)values(?,?,?,?,?)";
                PreparedStatement ps=conn.prepareStatement(sql);
                ps.setString(1,j.getTitle());
                  ps.setString(2,j.getDescription());
                    ps.setString(3,j.getCategory());
                      ps.setString(4,j.getStatus());
                        ps.setString(5,j.getLocation());
                        int i=ps.executeUpdate();
                        if(i==1){
                            f=true;
                        }
            }
            catch(Exception e){
                
                e.printStackTrace();
            }
            return f;
        }
        public List<jobs>getAllJobs(){
        List<jobs>list=new ArrayList<jobs>();
        jobs j=null;
        try{
            String sql="select * from jobs order by id desc";
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                j=new jobs();
             j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getTimestamp(7)+ "");
                
                list.add(j);
            }
        }
            catch(Exception e){
                    e.printStackTrace();
                    }
        return list;
        }
        
         public jobs getJobById(int id){

        jobs j=null;
        try{
            String sql="select * from jobs where id=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                j=new jobs();
             j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getTimestamp(7)+ "");
                
               
            }
        }
            catch(Exception e){
                    e.printStackTrace();
                    }
        return j;
        }
         
         public boolean updatejobs(jobs j){
             boolean f=false;
            try{
                String sql="update jobs set title=?,description=?,category=?,status=?,location=? where id=?";
                PreparedStatement ps=conn.prepareStatement(sql);
                ps.setString(1,j.getTitle());
                  ps.setString(2,j.getDescription());
                    ps.setString(3,j.getCategory());
                      ps.setString(4,j.getStatus());
                        ps.setString(5,j.getLocation());
                        ps.setInt(6,j.getId());
                        int i=ps.executeUpdate();
                        if(i==1){
                            f=true;
                        }
            }
            catch(Exception e){
                
                e.printStackTrace();
            }
            return f;
         }
         public boolean deletejobs(int id){
             
             boolean f=false;
             try{
                 String sql="delete from jobs where id=? ";
                 PreparedStatement ps=conn.prepareStatement(sql);
                 ps.setInt(1, id);
                 
                 int i=ps.executeUpdate();
                 if(i==1){
                     f=true;
                 }
             }
             catch(Exception e){
                 e.printStackTrace();
             }
             return f;
         }
         public List<jobs>getAllJobsForUser(){
        List<jobs>list=new ArrayList<jobs>();
        jobs j=null;
        try{
            String sql="select * from jobs where status=? order by id desc";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"Active");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                j=new jobs();
             j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getTimestamp(7)+ "");
                
                list.add(j);
            }
        }
            catch(Exception e){
                    e.printStackTrace();
                    }
        return list;
        }
         
       public List<jobs>getJobsOrLocationAndCategory(String category,String location){
        List<jobs>list=new ArrayList<jobs>();
        jobs j=null;
        try{
            String sql="select * from jobs where category=? or location=? order by id desc";
            PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, category);
           ps.setString(2, location);
           ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                j=new jobs();
             j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getString(7));
                
                list.add(j);
            }
        }
            catch(Exception e){
                    e.printStackTrace();
                    }
        return list;
        }
       public List<jobs>getJobsAndLocationAndCategory(String category,String location){
        List<jobs>list=new ArrayList<jobs>();
        jobs j=null;
        try{
            String sql="select * from jobs where category=? and location=? order by id desc";
            PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, category);
           ps.setString(2, location);
           ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                j=new jobs();
             j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getString(7));
                
                list.add(j);
            }
        }
            catch(Exception e){
                    e.printStackTrace();
                    }
        return list;
        }
        
        
        
}

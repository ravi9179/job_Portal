<%-- 
    Document   : view_job
    Created on : 30 Jun, 2023, 6:56:53 PM
    Author     : hp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.jobDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Job</title>
        <%@include file="all_css.jsp" %> 
        <style>
            .form{
                 display: flex;
            justify-content: space-between;
            }
             
        .box {
            flex: none;
            padding: 20px;
            border: none;
        }
            
        </style>
    </head>
    <body>
         <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
         <%@include file="navbar2.jsp" %>
         <div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center text-primary">All Jobs</h5>
            
             <%jobDAO dao=new jobDAO(DBConnection.getConn());
                    List<jobs> list=dao.getAllJobs();
                    for(jobs j:list)
           {%>
                    
                        <div class="card mt-2">
                <div class="card-body">
                    <div class="text-center text-primary">
                        <i class="far fa-clipboard fa-2x"></i>
                    </div>
                    
                   
                    
                    
                    <h6><%=j.getTitle()%></h6>
                    <p><%=j.getDescription()%></p>
                    <br>
                    <div class="form">
                        <div class="box col-md-3">
                            <input type="text" class="form-control form-control-sm" value="Location:<%=j.getLocation()%>" readonly>
                        </div>
                        <div class="box col-md-3">
                            <input type="text" class="form-control form-control-sm" value="Category:<%=j.getCategory()%>" readonly>
                        </div>
                        <div class="box col-md-3">
                            <input type="text" class="form-control form-control-sm" value="Status:<%=j.getStatus()%>" readonly>
                        </div>
                    </div>
                    <h6>Publish Date:<%=j.getPdate()%></h6>
                    <div class="text-center">
                      <a href="edit_job.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">Edit</a>


                        <a href="delete?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">Delete</a>
                    </div>
                </div>
            </div> 
                      <% 
                    }
                    %>
            
        </div>
    </div>
</div>
         
    </body>
</html>

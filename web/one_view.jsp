<%-- 
    Document   : one_view
    Created on : 8 Jul, 2023, 2:05:39 PM
    Author     : hp
--%>

<%@page import="com.entity.jobs"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User:Single Jobs</title>
          <%@include file="all_css.jsp" %> 
    </head>
    <body>
           <%@include file="navbar.jsp" %>
           <div class="container">
               <div class="row">
                   <div class="col-md-12">
                       <%  
                          int id=Integer.parseInt(request.getParameter("id"));
                          jobDAO dao=new jobDAO(DBConnection.getConn());
                          jobs j=dao.getJobById(id);
                       %>
                       <div class="card mt-5">
                           <div class="card-body">
                               <div class="text center text-primary">
                                   <i class="fa fa-clipboard fa-2x">
                                       
                                   </i>
                               </div>
                               <h6><%=j.getTitle()%></h6>
                               <p><%=j.getDescription()%></p>
                               <br>
                               <div class="form-row">
                                   <div class="form-group col-md-3">
                                       <input type="text" class="form-control form-control-sm"
                                              value="Location:<%=j.getLocation() %>"readonly>
                                   </div>
                                    <div class="form-group col-md-3">
                                       <input type="text" class="form-control form-control-sm"
                                              value="category:<%=j.getCategory() %>"readonly>
                                   </div>
                               </div>
                                   <h6>Publish Date: <%=j.getPdate().toString()%></h6>
                           </div>
                       </div>
                       
                       
                   </div>
               </div>
           </div>
    </body>
</html>

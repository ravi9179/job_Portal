<%-- 
    Document   : home
    Created on : 7 Jul, 2023, 11:18:58 PM
    Author     : hp
--%>


<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.db.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_css.jsp" %>
        <style>
  #location, #category {
    width: 100%;
  }
</style>

 
    </head>
    <body>
         <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="navbar2.jsp" %>
        <h1></h1>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary"> All Jobs</h5>
                    
                    
                   <div class="card">
  <div class="card-body">
    <form class="row align-items-center" action="more_view.jsp" method="get">
      <div class="form-group col-md-4 mt-1">
        <label for="location">Location:</label>
        <select name="loc" class="custom-select custom-select-lg" id="location">
          <option selected value="lo">Choose...</option>
          <option value="Mumbai">Mumbai</option>
          <option value="Delhi">Delhi</option>
          <option value="Bangalore">Bangalore</option>
          <option value="Pune">Pune</option>
          <option value="Indore">Indore</option>
          <option value="Bhopal">Bhopal</option>
        </select>
      </div>
      <div class="form-group col-md-4 mt-1">
        <label for="category">Category:</label>
        <select class="custom-select custom-select-lg" id="category" name="cat">
          <option value="ca" selected>Choose...</option>
          <option value="IT">IT</option>
          <option value="Java Developer">Java Developer</option>
          <option value="Python Developer">Python Developer</option>
          <option value="Database Engineer">Database Engineer</option>
          <option value="Full Stack">Full Stack</option>
        </select>
      </div>
      <div class="form-group col-md-4 mt-1">
        <button class="btn btn-success">Submit</button>
      </div>
    </form>
  </div>
</div>

                    
                    <%
                        jobDAO dao=new jobDAO(DBConnection.getConn());
                        List<jobs> list=dao.getAllJobsForUser();
                        for(jobs j:list){
                            
                            %>
                            
                            <div class="card mt-2">
                                <div class="card-body">
                                    <div class="text-center text-primary">
                                        <i class="far fa-clipboard fa-2x"></i>
                                        
                                    </div>
                                    <h6><%=j.getTitle()%></h6>
                                    <%
                                        if(j.getDescription().length()>0&&j.getDescription().length()<120){
                                            %>
                                            <p><%=j.getDescription()%></p>
                                       
                                        <%
                                            }else{ %>
                                            <p><%=j.getDescription().substring(0,120)%>...</p>
                                            <% } %>
                                            
                                            
                                            <br>
                                            <div class="d-flex align-items-center">
      <div class="mr-3">
        <h6>Location:</h6>
        <input type="text" class="form-control form-control-sm" value="<%=j.getLocation()%>" readonly>
      </div>
      <div>
        <h6>Category:</h6>
        <input type="text" class="form-control form-control-sm" value="<%=j.getCategory()%>" readonly>
      </div>
    </div>
  </div>
                                                <h6>Publish Date: <%=j.getPdate().toString()%></h6>
                                                <div class="text-center">
                                                    <a href="one_view.jsp?id=<%=j.getId()%>"
                                                       class="btn btn-sm bg-success text-white">View More</a>
                                                </div>
                                </div>
                            </div>
                            
                        <%  } %>
                    
                </div>
            </div>
        
    </body>
</html>

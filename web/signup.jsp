<%-- 
    Document   : signup
    Created on : 29 Jun, 2023, 4:21:57 PM
    Author     : hp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page</title>
         <%@include file="all_css.jsp" %> 
    </head>
    <body style="background-color:  #f0f1f2">
         <%@include file="navbar.jsp" %>
       <div class="container-fluid">
           <div class="row p-4">
               <div class="col-md-4 offset-md-4">
                   <div class="card">
                       <div class="card-body">
                           <div class="text-center">
                               <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                               <h5>Registration</h5>
                           </div> 
                           <c:if test="${not empty succmsg}">
                         <div class="alert alert-success" role="alert">${succmsg}</div>
                    <c:remove var="succmsg"/>
                    </c:if>
                               <form action="add_user" method="post">
                                   <div class="form-group">
                                       <label>Enter Full Name</label><input type="text"
                                                required="reuired" class="form-control"
                                                id="exampleInputEmail1" aria-describedby="emailHelp" name="name"> 
                                   </div> 
                                   <div class="form-group">
                                       <label >Enter Qualification</label><input type="text"
                                           required="required"  class="form-control"
                                           id="exampleInputPassword1" aria-describedby="emailHelp" name="qua">
                                   </div> 
                                   <div class="form-group">
                                       <label >Enter Email</label><input type="email"
                                           required="required"  class="form-control"
                                           id="exampleInputPassword1" aria-describedby="emailHelp" name="email">
                                   </div>
                                     <div class="form-group">
                                       <label for="ecampleInputPassword1">Enter Password</label><input type="text"
                                           required="required" type="password" class="form-control"
                                           id="exampleInputPassword1" aria-describedby="emailHelp" name="ps">
                                   </div>
                                   
                                    
                                   <button type="submit"
                                           class="btn btn-primary badge-pill btn-block">Register</button>
                               </form>
                       </div>
                   </div>
                   
               </div>
           </div>
       </div>
    </body>
</html>

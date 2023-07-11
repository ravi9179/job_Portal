<%-- 
    Document   : admin
    Created on : 29 Jun, 2023, 5:38:20 PM
    Author     : hp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
         <%@include file="all_css.jsp" %> 
         <style type="text/css">
             .back-img{
                 background: url("img/admin.jpg");
                 width: 50%;
                 height: 70vh;
                 background-repeat: no-repeat;
                 background-size: cover;
                    
             }
         </style>
    </head>
    <body>
        <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
          <%@include file="navbar2.jsp" %>
          <div class="container-fluid back-img">
            <div class="text-center">
                <h1 class="text-black p-4">Welcome Admin
                   
                </h1>
                </div>
        </div>
    </body>
</html>

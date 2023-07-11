<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_css.jsp" %> 
        <style type="text/css">
            
         .back-img{
    background: url("img/19873.jpg");
    width: 70%;
    height: 80vh;
    background-repeat: no-repeat;
    background-size: cover;
    
}
            
        </style>
    </head>
    <body>
        
        
        
        <%@include file="navbar.jsp" %>
        
        <%-- <% Connection conn=DBConnection.getConn();
                       out.println(conn);
%> --%>
        
        
        
        
        <div class="container-fluid back-img">
            <div class="text-center">
                <h1 class="text-black p-4">
                    <i class="fa fa-book" aria-hidden="false"></i> Online Job Portal
                </h1>
                </div>
        </div>
        <%@include file="footer.jsp"%>
        
    </body>

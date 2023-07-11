
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="com.dao.jobDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Job</title>
    <%@include file="all_css.jsp" %>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
        }

        .box {
            flex: 1;
            padding: 20px;
            border: none;
        }
    </style>
</head>
<body>
     <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
<%@include file="navbar.jsp" %>
<div class="container-fluid p-2">
    <div class="col-md-10 offset-md-1">
        <div class="card">
            <div class="card-body">
                <div class="text-center text-success">
                    <i class="fas fa-user-friends fa-3x"></i>
                     <c:if test="${not empty Succmsg}">
                         <div class="alert alert-success" role="alert">${Succmsg}</div>
                    <c:remove var="Succmsg"/>
                    </c:if>
                         
                         <%  int id = Integer.parseInt(request.getParameter("id"));
                         jobDAO dao=new jobDAO(DBConnection.getConn());
                            jobs j= dao.getJobById(id);
                             %>
                    <h5>Edit Jobs</h5>

                </div>
                <form action="update" method="post">
                    <input type="hidden" value="<%=j.getId()%>"name="id">
                    <div class="form-group">
                        <label>Enter Title</label><input type="text" name="title"
                                                         required class="form-control" value= "<%=j.getTitle() %>">
                    </div>
                    <div class="container">
                        <div class="box">
                            <label>Location</label>
                            <select class="custom-select" id="inlineFormCustomSelectPref" name="location">
    <option value="<%= j.getLocation() %>"><%= j.getLocation() %></option>
    <option value="Mumbai">Mumbai</option>
    <option value="Delhi">Delhi</option>
    <option value="Bangalore">Bangalore</option>
    <option value="Pune">Pune</option>
    <option value="Indore">Indore</option>
    <option value="Bhopal">Bhopal</option>
 </select>
 
                        </div>
                        <div class="box">
                            <label>Category</label>
                            <select class="custom-select" id="inlineFormCustomSelectPref" name="category">
                                <option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
                                <option value="IT">IT</option>
                                <option value="Java Developer">Java Developer</option>
                                <option value="Python Developer">Python Developer</option>
                                <option value="Database Engineer">Database Engineer</option>
                                <option value="Full Stack">Full Stack</option>
                            </select>
                        </div>
                        <div class="box">
                            <label>Status</label>
                            <select class="custom select" id="status" name="status">
                                <option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
                                <option class="Active" value="Active">Active</option>
                                <option class="Inactive" value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label>Enter Description</label>
                        <textarea required rows="6" cols="" name="desc"
                                  class="form-control"> <%=j.getDescription()%></textarea>
                    </div>
                    <button class="btn btn-success">Update Job</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
 
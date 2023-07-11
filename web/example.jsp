<%-- 
    Document   : example
    Created on : 30 Jun, 2023, 4:38:12 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        .container {
            display: flex;
            justify-content: space-between;
        }
        
        .box {
            flex: 1;
            padding: 20px;
            border: 1px solid black;
        }
    </style>
    </head>
    <body>
       <div class="container">
    <div class="box">
        <label>Location</label>
        <select name="Location" class="custom-select" id="inlineFormCustomSelectPref">
            <option selected>Choose...</option>
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
            <option selected>Choose..</option>
            <option value="IT">IT</option>
            <option value="Java Developer">Java Developer</option>
            <option value="Python Developer">Python Developer</option>
            <option value="Database Engineer">Database Engineer</option>
            <option value="Full Stack">Full Stack</option>
        </select>
    </div>
    <div class="box">
        <label>Status</label>
        <select class="form-control" name="status">
            <option class="Active" value="Active">Active</option>
            <option class="Inactive" value="Inactive">Inactive</option>
        </select>
    </div>
</div>

    </body>
</html>

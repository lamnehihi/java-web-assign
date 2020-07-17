<%-- 
    Document   : addNewUser
    Created on : Jun 19, 2020, 8:43:55 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add New User</h1>
        <form action="NewUserController">
            <label>Email: </label>
            <input type="text" name="email" value="${param.email}" required><br />
            <label>Password: </label>
            <input type="password" name="password" value="${param.password}" required><br />
            <label>Name: </label>
            <input type="text" name="name" value="${param.name}" required><br />
            <label>Phone: </label>
            <input type="text" name="phone" value="${param.phone}" required><br />
            <label>Address: </label>
            <input type="text" name="address" value="${param.address}" required><br />
            <input type="Submit" value="Add">
        </form>
    </body>
</html>

<%-- 
    Document   : index
    Created on : Jun 19, 2020, 7:47:30 PM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <h1>Magazine</h1>
        <table border="1">
            <tr>
                <td>UID</td>
                <td>Email</td>
                <td>Password</td>
                <td>Name</td>
                <td>Phone</td>
                <td>Address</td>
            </tr>

            <%
                if (request.getAttribute("data") == null) {
                    request.getRequestDispatcher("viewAllUser").forward(request, response);
                }
                List<User> list = (List<User>) request.getAttribute("data");
                for (User user : list) {
            %>
            <tr>
                <td><%=user.getuID()%></td>
                <td><%=user.getuEmail()%></td>
                <td><%=user.getuPassword()%></td>
                <td><%=user.getuName()%></td>
                <td><%=user.getuPhone()%></td>
                <td><%=user.getuAddress()%></td>
            </tr>
            <%
                }
            %>
            <a href="addNewUser.jsp">Add New User</a>
            <hr>
            
        </table>
    </body>
</html>

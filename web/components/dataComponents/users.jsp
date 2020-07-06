<%-- 
    Document   : books
    Created on : Jun 29, 2020, 8:15:56 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="Controller.UserDB"%>
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    var dataSet = [];
    <%
        List<User> bl = UserDB.getAllUser();
    %>
    <% for (int i = 0; i < bl.size(); i++) {%>
    dataSet.push(<%= bl.get(i).toString()%>);
    <% }%>
    $("#userDataTable").DataTable(
            {
                data: dataSet,
                columns: [
                    {title: "ID"},
                    {title: "Email"},
                    {title: "Password"},
                    {title: "Username"},
                    {title: "Phone"},
                    {title: "Address"}
                ]
            });
</script>
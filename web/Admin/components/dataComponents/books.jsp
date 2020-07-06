<%-- 
    Document   : books
    Created on : Jun 29, 2020, 8:15:56 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="Controller.BookDB"%>
<%@page import="Model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    var dataSet = [];
    <%
        List<Book> bl = BookDB.getAll();
    %>
    <% for (int i = 0; i < bl.size(); i++) {%>
    dataSet.push(<%= bl.get(i).toString()%>);
    <% }%>
    $("#bookDataTable").DataTable(
    {
    data: dataSet,
            columns: [
            {title: "ID"},
            {title: "Title"},
            {title: "Category"},
            {title: "Price"},
            {title: "Quantity"},
            {title: "Author"},
            {title: "Cover"}
            ]
    });
</script>

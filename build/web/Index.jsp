<%-- 
    Document   : index
    Created on : Jun 26, 2020, 8:03:55 PM
    Author     : Admin
--%>

<%@page import="Controller.UserDB"%>
<%@page import="Model.User"%>
<%@page import="Controller.BookDB"%>
<%@page import="Controller.BookDB"%>
<%@page import="java.util.*"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <title>Document</title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
            integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
            crossorigin="anonymous"
            />
        <link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
        <!--Css lib-->
        <link rel="stylesheet" href="css/Index.css" />
        <link rel="stylesheet" href="css/Container-right.css" />
        <link rel="stylesheet" href="css/SideBar.css" />
        <link rel="stylesheet" href="css/TopBar.css" />
        <link rel="stylesheet" href="css/DashBoard.css" />

        <script
            src="https://kit.fontawesome.com/e96465b91f.js"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css"
            />
    </head>
    <!-- ----------------------------------------------------------------------------------------------------------------------- -->
    <body>

        <div class="wrapper">
            <!-- SideBar -->
            <jsp:include page="components/sideBar.jsp"/>

            <div class="container-right">
                <!-- Topbar -->
                <jsp:include page="components/topBar.jsp"/>
                
                <!--Content-->
                <%
                    if (request.getParameter("value") == null) {
                %>
                <jsp:include page="components/dashboard.jsp"/>
                <% } else if (request.getParameter("value").equalsIgnoreCase("books")) {
                %>
                <jsp:include page="components/books.jsp"/>
                <% } else if (request.getParameter("value").equalsIgnoreCase("users")) {
                %>
                <jsp:include page="components/users.jsp"/>
                <% } else if (request.getParameter("value").equalsIgnoreCase("orders")) {
                %>
                <jsp:include page="components/orders.jsp"/>
                <% }
                %>
            </div>
        </div>

        <!-- Boot strap js -->
        <script
            src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"
        ></script>

        <script
            type="text/javascript"
            src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"
        ></script>
        <script
            type="text/javascript"
            src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"
        ></script>

        <!-- Table data -->
        <%
            if (request.getParameter("value") == null) {
        %>
        <% } else if (request.getParameter("value").equalsIgnoreCase("books")) {
        %>
        <jsp:include page="components/dataComponents/books.jsp"/>
        <% } else if (request.getParameter("value").equalsIgnoreCase("users")) {
        %>
        <jsp:include page="components/dataComponents/users.jsp"/>
        <% } else if (request.getParameter("value").equalsIgnoreCase("orders")) {
        %>
        <jsp:include page="components/orders.jsp"/>
        <% }
        %>

    </body>
</html>


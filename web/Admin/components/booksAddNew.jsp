<%-- 
    Document   : booksAddNew
    Created on : Jul 6, 2020, 11:40:54 AM
    Author     : Admin
--%>

<%@page import="Controller.CategoryDB"%>
<%@page import="java.util.List"%>
<%@page import="Model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid content d-flex flex-column">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">New Books</h1>
    <div>
        <div class="input-group mb-3 col-xl-6 p-0">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1" >Title</span>
            </div>
            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
        </div>

        <div class="input-group mb-3 col-xl-6 p-0">
            <div class="input-group-prepend">
                <label class="input-group-text" for="inputGroupSelect01">Category</label>
            </div>
            <select class="custom-select" id="inputGroupSelect01">
                <option selected>Choose...</option>
                <%
                    List<Category> cl = CategoryDB.getAll();
                %>
                <% for (int i = 0; i < cl.size(); i++) {%>
                <option value=<%=i%>><%=cl.get(i).getCatName()%></option>
                <% }%>
            </select>
        </div>

        <div class="input-group mb-3 col-xl-3 col-lg-3 p-0">
            <div class="input-group-prepend">
                <span class="input-group-text">$</span>
            </div>
            <input type="number" class="form-control" aria-label="Amount (to the nearest dollar)">
            <div class="input-group-append">
                <span class="input-group-text">.00</span>
            </div>
        </div>

        <div class="input-group col-xl-6 p-0">
            <div class="input-group-prepend">
                <span class="input-group-text">Description</span>
            </div>
            <textarea class="form-control" aria-label="With textarea"></textarea>
        </div>
    </div>
</div>
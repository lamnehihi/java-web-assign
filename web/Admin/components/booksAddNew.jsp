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
    <div class="">
        <form method="POST" action="newBook">

            <div class="input-group mb-3 col-xl-6 p-0">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1" >Title</span>
                </div>

                <!--Title book here !!!-->

                <input name="title" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
            </div>

            <div class="input-group mb-3 col-xl-6 p-0">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1" >Author</span>
                </div>

                <!--Author book here !!!-->

                <input name="author" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
            </div>

            <div class="input-group mb-3 col-xl-6 p-0">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">Category</label>
                </div>

                <!--Category book here !!!-->

                <select name="category" class="custom-select" id="inputGroupSelect01">
                    <option selected>Choose...</option>
                    <%
                        List<Category> cl = CategoryDB.getAll();
                    %>
                    <% for (int i = 0; i < cl.size(); i++) {%>
                    <option value=<%=cl.get(i).getCatID()%> > <%=cl.get(i).getCatName()%></option>
                    <% }%>
                </select>
            </div>

            <div class="input-group mb-3 col-xl-3 col-lg-3 p-0">
                <div class="input-group-prepend">
                    <span class="input-group-text">$</span>
                </div>

                <!--Price book here !!!-->

                <input name="price" type="number" class="form-control" aria-label="Amount (to the nearest dollar)">
                <div class="input-group-append">
                    <span class="input-group-text">.00</span>
                </div>
            </div>

            <div class="input-group mb-3 col-xl-3 col-lg-3 p-0">
                <div class="input-group-prepend">
                    <span class="input-group-text">Quantity</span>
                </div>

                <!--Quantity book here !!!-->

                <input name="quantity" type="number" class="form-control" aria-label="Amount (to the nearest dollar)">
            </div>

            <div class="input-group mb-3 col-xl-6 p-0">
                <div class="input-group-prepend">
                    <span class="input-group-text">Description</span>
                </div>
                <textarea name="description" class="form-control" aria-label="With textarea"></textarea>
            </div>

            <div class="input-group mb-3 col-xl-6 p-0">
                <div class="input-group-prepend">
                    <span class="input-group-text">Upload Cover</span>
                </div>
                <div class="custom-file">
                    
                    <!--Cover book here !!!-->
                    
                    <input name="cover" type="file" class="custom-file-input" id="inputGroupFile01">
                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                </div>
            </div>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary w-50" data-toggle="modal" data-target="#exampleModal">
                Add
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Please check the details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Add new book ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            
                            <!--Submit button !!!-->
                            
                            <button type="submit" class="btn btn-success">Add</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>


    </div>
</div>
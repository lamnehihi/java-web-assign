<%-- 
    Document   : books.jsp
    Created on : Jun 29, 2020, 9:13:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid content">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Books</h1>
    
    <div id="demo_info" class="box"></div>

    <!--Adding new book-->
    <a href="books?value=addNew" class="badge badge-success">+ Add new</a>

    <p class="mb-4">
        DataTables is a third party plugin that is used to generate the demo table below. For more information, please visit the DataTables.net 
    </p>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <table
                id="bookDataTable"
                class="display table table-striped table-bordered"
                width="100%"
                >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Author</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Author</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>



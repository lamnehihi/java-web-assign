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
//    $("#bookDataTable").DataTable(
//        {data: dataSet}
//    );

    $(document).ready(function () {
        var table = $('#bookDataTable')
                .DataTable({
                    "lengthMenu": [[-1, 50, 20, 10], ["All", 50, 20, 10]],
                    "data": dataSet
                });

        $('#bookDataTable tbody tr').each(function ()
        {

//        Action to edit and delete book !!!

            $(this).append('<td><a href="updateBook?id=' + table.row(this).data()[0] + '" class="btn btn-primary btn-sm" role="button" aria-pressed="true">Edit</a> <a href="deleteBook?id=' + table.row(this).data()[0] + '" class="btn btn-danger btn-sm" role="button" aria-pressed="true">Del</a></td>');
        });
    });

</script>



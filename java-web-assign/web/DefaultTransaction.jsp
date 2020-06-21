<%-- 
    Document   : Default Transaction
    Created on : 10-Jun-2020, 11:38:33
    Author     : tran phu phat
--%>


<%@page import="Controller.TransactionDB"%>
<%@page import="Model.Transaction"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td>Code Order </td>   
                <td>Date of purchase</td>
                <td>Product</td>
                <td>Total money</td>
                <td>Order status</td>
            </tr>
            <%
                //TransactionDB Tr = new TransactionDB();
                ArrayList<Transaction> ls = TransactionDB.getByStatus(false);
                for (Transaction l : ls) {
                    String product = l.getCart().get(0).getBook().getbName();
                    if (l.getCart().size() > 1) {
                        product += "   and " + (l.getCart().size() - 1) + " others";
                    }
                    out.print("<tr>" + "<td>" + l.gettID() + "</td>" + "<td>" + l.gettDate() + "</td>" + "<td>" + product + "</td>" + "<td>" + l.getTotal() + "</td>" + "<td>" + l.isStatus() + "</td>" + "</tr>");
                }
            %>
        </table>
    </body>
</html>

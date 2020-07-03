<%-- 
    Document   : Search
    Created on : 03-Jul-2020, 16:44:00
    Author     : tran phu phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Search!</h1>
        <s:form action="Search"  >
            <s:textfield name="Searchbyname" lable="Search value" /><br/>
            <s:submit value="Search"/>
            </s:form><br/>
    </body>
</html>
